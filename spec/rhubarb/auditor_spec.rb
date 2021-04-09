RSpec.describe Rhubarb::Auditor do
  context "connect" do
    it "should connect" do
      con = Rhubarb::Auditor.new
      expect(con.connection).not_to be nil
    end
  end

  context "contains?" do
    it "should exist" do
      con = Rhubarb::Auditor.new
      expect(con.contains?("Vaad")).to be true
    end
  end
end