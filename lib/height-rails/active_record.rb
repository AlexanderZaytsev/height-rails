require 'active_support/concern'
require 'active_support/core_ext/array/extract_options'

module HeightRails
  module ActiveRecord
    extend ActiveSupport::Concern

    module ClassMethods
      def height(attribute, *args)
        options = args.extract_options!
        column = options[:column] || "#{attribute}_in_centimeters"

        define_method "#{attribute}" do
          memoized = instance_variable_get("@#{attribute}")
          return memoized if memoized

          centimeters = send(column)
          instance_variable_set "@#{attribute}", Height.new(centimeters)
        end

        define_method "#{attribute}=" do |input|
          if input.is_a? Height
            height = input
          else
            height = Height.new(input)
          end

          send("#{column}=", height.centimeters)
          instance_variable_set "@#{attribute}", height
        end

      end
    end
  end
end