# frozen_string_literal: true

require_relative "rhubarb/version"
require "pp"
require "mac/say"
require "random_name_generator"

# Rhubarb
module Rhubarb
  class Error < StandardError; end
  # Your code goes here...

  def self.yo
    talker = Mac::Say.new(voice: :alex, rate: 200)
    talker.say string: RandomNameGenerator.new(RandomNameGenerator::CURSE).compose
  end

  # Rhubarb Cannon
  class Canon
    attr_reader :voices

    ALEX = Mac::Say.new(voice: :alex)
    ALICE = Mac::Say.new(voice: :alice)
    DANIEL = Mac::Say.new(voice: :daniel)
    ELLEN = Mac::Say.new(voice: :ellen)
    FRED = Mac::Say.new(voice: :fred)
    KAREN = Mac::Say.new(voice: :karen)
    THOMAS = Mac::Say.new(voice: :thomas)

    SELECTED_VOICES = [ALEX, ALICE, DANIEL, ELLEN, FRED, KAREN, THOMAS].freeze

    def initialize
      @voices = Mac::Say.voices.collect { |v| v[:name] }
    end

    def yo(name = RandomNameGenerator.flip_mode.compose)
      SELECTED_VOICES.sample.say string: name
    end
  end
end
