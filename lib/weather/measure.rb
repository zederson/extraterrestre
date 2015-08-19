module Weather
  class Measure

    attr_accessor :location, :engine

    def initialize(location, engine)
      @location = location
      @engine   = engine
    end

    def temperature
      engine.current.temperature
    end

    def high
      engine.today.high
    end

    def low
      engine.today.low
    end

    def icon
      engine.current.icon
    end

    def condition
      engine.current.condition
    end

    def humidity
      engine.current.humidity
    end

    def self.search
      build
    end

    def self.build
      result = cache.read('weather')
      result = put if result.nil?
      result
    end

    def self.put
      local     = app_config.weather.local
      barometer = Barometer.new(local)
      weather   = barometer.measure
      result    = Weather::Measure.new(local, weather)

      cache.write('weather', result)
      result
    end

    def self.cache
      @@cache ||= ActiveSupport::Cache::MemoryStore.new({ expires_in: 1.hour })
    end
  end
end
