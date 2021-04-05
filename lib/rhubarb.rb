# frozen_string_literal: true

require 'httparty'
require "logger"
require "random_name_generator"
require "time"

require_relative "rhubarb/canon"
require_relative "rhubarb/orator"
require_relative "rhubarb/version"

# Rhubarb
module Rhubarb
  class Error < StandardError; end
end
