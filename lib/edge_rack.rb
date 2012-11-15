require 'rack'
require 'net/http'
require 'pathname'

module EdgeRack
end

require 'edge_rack/middleware'
if defined?(Rails)
  require 'edge_rack/railtie' 
end