RSpec.describe Rhubarb::Canon do
  context "with cyrillic letters" do
    it "should fire" do
      name = "pómnüizwche"
      expect(Rhubarb::Canon.new.fire(name: name, cyrillic: true)).to be true
    end
  end
end