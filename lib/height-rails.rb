require "height"
require "action_view"
require "height-rails/active_record"
require "height-rails/height_select"
require "height-rails/version"

module HeightRails
end

if defined? Rails
  require "height-rails/railtie"
  require "height-rails/engine"
end