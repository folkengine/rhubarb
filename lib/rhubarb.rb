# frozen_string_literal: true

require "logger"
require "random_name_generator"
require "time"

require_relative "rhubarb/version"
require_relative "rhubarb/orator"

# Rhubarb
module Rhubarb
  class Error < StandardError; end

  # Rhubarb Cannon
  class Canon
    attr_reader :orator

    def initialize
      @orator = Orator.new
      initialize_logger
      initialize_recorder
    end

    def initialize_logger
      time = Time.now.utc.iso8601
      name = "logs/log.#{time}.log"
      @logger = Logger.new(name)
      @logger.level = Logger::DEBUG
    end

    def initialize_recorder
      time = Time.now.utc.iso8601

    end

    def name(name = RandomNameGenerator.flip_mode.compose)
      @logger.error name
      @orator.speech name
      name
    end
  end
end
