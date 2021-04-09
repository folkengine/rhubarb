require "pg"

module Rhubarb
  class Auditor
    attr_reader :connection

    def initialize
      @connection = PG::Connection.new(ENV["DATABASE_URL"])
    end

    def contains?(name)
      res @connection.exec_params("SELECT * where name = $1", [name])
      res.present?
    end
  end
end