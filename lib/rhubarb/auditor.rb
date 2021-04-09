require "pg"

module Rhubarb
  class Auditor
    attr_reader :connection

    DBCONN = "postgres://sjljbqoxxlkvuv:481af6b5854859dfee8fcbf9ee213c69ebda6f90bd4ba408b2fd68e41a91f4c7@ec2-3-211-37-117.compute-1.amazonaws.com:5432/dbufrefjald3e2"

    def initialize
      @connection = PG::Connection.new(DBCONN)
    end

    def contains?(name)
      res @connection.exec_params("SELECT * from names where name = $1", [name])
      res.present?
    end
  end
end