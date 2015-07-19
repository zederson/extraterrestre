module Home
  class Executor
    attr_accessor :activity

    def initialize(activity)
      @activity = activity
    end

    def exists_module?
      modules.include?(module_name)
    end

    def module_name
      activity.device_configuration.device.module_name
    end

    def modules
      app_config.modules
    end

    class << self
      def build(activity)
        create_module(activity)
      end

      def create_module(activity)
        exec = Home::Executor.new(activity)
        return nil unless exec.exists_module?
        exec.module_name.constantize.new(activity)
      end
    end
  end
end
