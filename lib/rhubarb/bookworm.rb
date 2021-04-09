# frozen_string_literal: true

require 'date'
require 'fileutils'

module Rhubarb
  # Rhubarb Bookworm
  class Bookworm
    def initialize(filepath = "logs/log.log")
      @filepath = filepath
    end

    def read
      File.readlines(@filepath).each do |line|
        name = line.to_s.partition(' : ').last
        unless name.empty?
          puts name
        end
      end
    end

    def archive
      if(File.exist?(@filepath))
        seconds = DateTime.now.strftime('%s')
        to = "logs/#{seconds}.log"
        puts to
        FileUtils.mv @filepath, to
      else
        puts "no #{@filepath} found"
      end
    end
  end
end
