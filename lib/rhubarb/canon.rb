require "translit"

module Rhubarb
  # Rhubarb Cannon
  class Canon
    attr_reader :orator

    BASE_URL = "http://127.0.0.1:3000/greetings/howdy?name=".freeze

    def initialize
      @orator = Orator.new
      initialize_logger
      initialize_recorder
    end

    def initialize_logger
      # time = Time.now.utc.iso8601
      name = "logs/log.log"
      @logger = Logger.new(name)
      @logger.level = Logger::DEBUG
    end

    def initialize_recorder
      time = Time.now.utc.iso8601
    end

    def fire(name: RandomNameGenerator.flip_mode.compose, cyrillic: false)
      begin
        uri = generate_url(name)
        puts "\n\tHTTP GET #{uri}"
        HTTParty.get(uri)
        name(name: name, cyrillic: cyrillic)
        @logger.info name
        true
      rescue Errno::ECONNREFUSED
        @orator.alert("Connection refused")
        false
      end
    end

    def name(name: RandomNameGenerator.flip_mode.compose, cyrillic: false)
      if cyrillic
        @orator.speech Translit.convert(name, :english)
      else
        @orator.speech name
      end
      name
    end

    def generate_url(name)
      "#{BASE_URL}#{CGI.escape(name)}"
    end
  end
end
