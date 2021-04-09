# frozen_string_literal: true

require 'httparty'
require "logger"
require "random_name_generator"
require "time"

require_relative "rhubarb/auditor"
require_relative "rhubarb/bookworm"
require_relative "rhubarb/canon"
require_relative "rhubarb/orator"
require_relative "rhubarb/version"

# Rhubarb
module Rhubarb
  class Error < StandardError; end

  CANON = Rhubarb::Canon.new
  FREQUENCY = 10
  RNG = RandomNameGenerator.new
  RNG_RU = RandomNameGenerator.new(RandomNameGenerator::FANTASY_RU)

  def self.go(count:, cyrillic:, short: false)
    count.times do
      if cyrillic && rand(1..FREQUENCY) == 1
        Rhubarb.fire_ru(short: short)
      else
        Rhubarb.fire(short: short)
      end
    end
  end

  def self.fire(short: false)
    name = short ? RNG.compose(2) : RNG.compose
    print "#{name}\t\t"
    CANON.fire(name: name, cyrillic: false)
  end

  def self.fire_ru(short: false)
    name = short ? RNG_RU.compose(2) : RNG_RU.compose
    print "#{name}\t\t"
    CANON.fire(name: name, cyrillic: false)
  end
end
