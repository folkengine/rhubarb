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

    def fire(name = RandomNameGenerator.flip_mode.compose)
      escaped_name = CGI.escape(name)
      url = "#{BASE_URL}#{escaped_name}"

      begin
        HTTParty.get(url)
        name(name)
        @logger.info name
        true
      rescue Errno::ECONNREFUSED
        @orator.alert("Connection refused")
        false
      end
    end

    def name(name = RandomNameGenerator.flip_mode.compose)
      @orator.speech name
      name
    end
  end
end
