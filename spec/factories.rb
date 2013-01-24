require 'height-rails'

class User
  include HeightRails::ActiveRecord

  attr_accessor :height_in_centimeters

  height :height

  def initialize(centimeters)
    self.height_in_centimeters = centimeters
  end
end

class UserWithCustomHeightField
  include HeightRails::ActiveRecord

  attr_accessor :custom_height_field

  height :height, column: :custom_height_field

  def initialize(centimeters)
    self.custom_height_field = centimeters
  end
end