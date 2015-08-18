module Bender
  module Api
    class Client

      def get_resource(uri)
        url      = "#{endpoint}#{uri}"
        response = http_client_get url
        return {} unless response

        JSON.parse(response)
      end

      def http_client_get(url)
        begin
          http   = HTTPClient.new
          result = http.get(url, headers)
          result.body
        rescue
          nil
        end
      end

      def put(uri, payload)
        url      = "#{endpoint}#{uri}"

        response = HTTPClient.put(url, payload, headers)
        return {} unless response

        response = JSON.parse(response.content)
        return response
      end

      def headers
        {
          "Accept"         => "application/json",
          "Content-Type"   => "application/json"
        }
      end

      def endpoint
        app_config.bender.endpoint
      end
    end
  end
end
