module Home
  module Lamp
    class Philips
      attr_accessor :activity

      def initialize(activity)
        @activity = activity
      end

      def execute
        hash = to_json
        hash[:lamps].each { |lamp| send_signal lamp }
        true
      end

      def content
        activity.device_configuration.content
      end

      def to_json
        JSON.parse(content, symbolize_names: true)
      end

      def send_signal(lamp)
        hue = Huey::Bulb.find(lamp.delete(:name))
        lamp.each { |k,v| hue.send("#{k.to_s}=", v) }
        hue.commit
      end
    end
  end
end
