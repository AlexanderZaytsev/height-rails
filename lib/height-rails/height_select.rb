module ActionView
  module Helpers
    module FormOptionsHelper
      def height_select(object, object_name, method, options = {})
        if options[:system] == :imperial
          options.reverse_merge!({ min: 20, max: 90 })
        else
          options.reverse_merge!({ min: 50, max: 210, system: :metric })
        end

        height = object.send(method)

        if options[:system] == :imperial
          collection = height_imperial_collection(options[:min], options[:max])
        else
          collection = height_metric_collection(options[:min], options[:max])
        end

        select(object_name, method, collection, selected: height.centimeters)
      end

      private
        def height_metric_collection(min =  50, max = 210)
          min.upto(max).map do |centimeters|
            height = Height.new(centimeters)
            [height.to_s(:default, :metric), height.centimeters]
          end
        end

        def height_imperial_collection(min = 22, max = 80)
          min.upto(max).map do |inches|
            height = Height.new(Height::Units::Inches.new(inches))
            [height.to_s(:default, :imperial), height.centimeters]
          end
        end
    end

    class FormBuilder
      def height_select(method, options = {})
        @template.height_select(@object, @object_name, method, objectify_options(options))
      end
    end
  end
end
