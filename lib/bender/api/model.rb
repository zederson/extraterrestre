module Bender
  module Api
    class Model

      TEMPERATURE = 'TEMPERATURE'
      LUMINOSITY  = 'LUMINOSITY'

      attr_accessor :content

      def initialize(content)
        @content = content
      end

      def temperature
        result = find_by_type TEMPERATURE
        result['content'] if result
      end

      def luminosity
        result = find_by_type LUMINOSITY
        result['content'] if result
      end

      def luminosity_percent
        light = luminosity
        (light.to_f / 1023) * 100
      end

      def luminosity_status
        result = find_by_type LUMINOSITY
        result['status'] if result
      end

      def toggle_luminosity
        client = Bender::Api::Client.new
        result = client.put '/bender/lights/', {}
        result['status']
      end

      def find_by_type(type)
        content.select { |value| value['type'] == type }.first
      end

      def self.load
        new(status)
      end

      def self.status
        client = Bender::Api::Client.new
        client.get_resource('/bender/status')
      end
    end
  end
end
