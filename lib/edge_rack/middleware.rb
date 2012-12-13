
module EdgeRack
  class Middleware
    def initialize(app, options={})
      @app = app

      @options = {
        project_path: Dir.pwd,
        project_name: Pathname.new(Dir.pwd).basename,
        host: "http://localhost"
      }.merge(options)

      @kind = "rack"

      if defined?(Rails) 
        @paths = {
          css: Rails.application.config.assets[:paths],
          sass: (Rails.application.config.sass[:load_paths] rescue []),
          less: (Rails.application.config.less[:paths] rescue [])
        }

        @kind = "rails"
      end

      params = { 
        project_path: @options[:project_path],
        project_name: @options[:project_name],
        project_kind: @kind
      }

      if defined?(Rails)
        params[:load_paths] = ActiveSupport::JSON.encode(@paths)
      end

      # Thread.new do
      #   Net::HTTP.post_form(
      #     URI.parse('http://localhost:48626/project'),
      #     params
      #   )
      # end
    end

    def call(env)
      @env = env

      @status, @headers, @response = @app.call(env)
      
      if is_edge_compatible_response?
        update_response!
        update_content_length!
      end

      [@status, @headers, @response]
    end

    private

    def update_response!
      @response.each do |part|
        if is_regular_request? && is_html_response?
          insert_at = part.index('</body')
          unless insert_at.nil?
            part.insert(insert_at, render_edge_scripts)
          end
        end
      end
    end

    def update_content_length!
      new_size = 0
      @response.each{|part| new_size += part.bytesize}
      @headers.merge!("Content-Length" => new_size.to_s)
    end

    def is_regular_request?
      !is_ajax_request?
    end

    def is_ajax_request?
      @env.has_key?("HTTP_X_REQUESTED_WITH") && @env["HTTP_X_REQUESTED_WITH"] == "XMLHttpRequest"
    end

    def is_html_response?
      @headers["Content-Type"].include?("text/html") if @headers.has_key?("Content-Type")
    end

    def is_edge_compatible_response?
      return false if @status == 302
      return false if @env.has_key?("HTTP_SKIP_EDGE_MIDDLEWARE")
      is_html_response?
    end

    def render_edge_scripts
      <<-EOT
        <script type="text/javascript" src="http://localhost:48626/edge.js" data-project="#{@options[:project_name]}"></script>
      EOT
    end
  end
end