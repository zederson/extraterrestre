module Bender
  module Api
    class Socket

      attr_accessor :name, :status

      def initialize(name, status)
        @name = name
        @status = status
      end

      def id
        @id ||= begin
                  ex = /^SOCKET_([0-9]*)/.match(name)
                  ex[1]
                end
      end

      def description
        I18n.t "bender.sockets.#{name}.name"
      end

      def icon
        I18n.t "bender.sockets.#{name}.icon"
      end

      def self.build(content)
        sockets = content.select{ |v| v['type'] =~ /SOCKET_[0-9]*/ }
        Array.new.tap do |p|
          sockets.each { |s| p << self.new(s['type'], s['content']) }
        end
      end

      def self.send(id, status)
        client = Bender::Api::Client.new
        client.put "/bender/#{id}/socket", { status: status }
      end
    end
  end
end
