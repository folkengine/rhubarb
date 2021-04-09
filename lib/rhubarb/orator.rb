# frozen_string_literal: true

require "pp"
require "mac/say"

module Rhubarb
  class Orator
    attr_reader :voices

    ALEX = Mac::Say.new(voice: :alex)
    ALICE = Mac::Say.new(voice: :alice)
    DANIEL = Mac::Say.new(voice: :daniel)
    ELLEN = Mac::Say.new(voice: :ellen)
    FRED = Mac::Say.new(voice: :fred)
    JUAN = Mac::Say.new(voice: :juan)
    KAREN = Mac::Say.new(voice: :karen)
    TESSA = Mac::Say.new(voice: :tessa)
    THOMAS = Mac::Say.new(voice: :thomas)

    SELECTED_VOICES = [ALEX, ALICE, DANIEL, ELLEN, FRED, JUAN, KAREN, THOMAS].freeze
    FAILURE_MESSAGES = [
      "you have failed",
      "you are a failure",
      "try again",
      "no",
      "not quite",
      "unsatisfactory",
      "incompetent"
    ].freeze

    EXTREME_FAILURE_MESSAGES = [
      "you are a disappointment",
      "I feel sorry for you",
      "begin home",
      "please stop",
      "stop already",
      "You're what the French call: 'les incompetents'.",
      "Were you always this stupid or did you take lessons?",
      "where'd you learn to code, the toilet store?",
      "perhaps you should phone a friend",
      "You may look like an idiot and talk like an idiot but don't let that fool you – you really are an idiot.",
      "why don't you give up?"
    ].freeze

    def self.introduction
      orator = Orator.new
      orator.introduction
    end

    def self.persona
      orator = Orator.new
      orator.persona
    end

    def self.tod
      orator = Orator.new
      orator.tod
    end

    def self.roll_call
      orator = Orator.new
      orator.roll_call
    end

    def initialize
      @voices = Mac::Say.voices.collect { |v| v[:name] }
    end

    def persona
      SELECTED_VOICES.each do |v|
        puts v.config[:voice]
        v.say string: v.config[:voice]
      end
      TESSA.say string: "Tessa"
    end

    def roll_call(names = @voices)
      names.each do |v|
        talker = Mac::Say.new(voice: v)
        puts v
        talker.say string: v
      end
    end

    def speech(says, voice = SELECTED_VOICES.sample)
      voice.say string: says
    end

    def alert(says, voice = TESSA)
      speech(says, voice)
    end

    def failure
      rnd = rand(1..10)
      if rnd == 1
        alert EXTREME_FAILURE_MESSAGES.sample
      else
        alert FAILURE_MESSAGES.sample
      end
    end

    def tod
      alert "Thank you for your time. Here is Tod to talk about Neauraquarium: Evolving Neural Networks though ECO System Simulation."
    end

    def introduction
      hello = "Hello, I am Rhubarb version #{Rhubarb::VERSION}, your automated observability test harness. "\
        "I am here to ensure that your program is performing at acceptable parameters."

      hard = "I am hard but I am fair. You will not like me, but understand that what I am "\
        "doing is for the greater good."
      alert hello
      sleep 1
      alert hard
    end
  end
end
