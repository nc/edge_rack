require 'rack'
require 'net/http'
require 'pathname'

warn "[DEPRECATION] `edge_rack` gem is deprecated.  Please use `rack-takana` instead."

module EdgeRack
end

require 'edge_rack/middleware'
if defined?(Rails)
  require 'edge_rack/railtie' 
end