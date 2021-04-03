# frozen_string_literal: true

RSpec.describe Rhubarb do
  it "has a version number" do
    expect(Rhubarb::VERSION).not_to be nil
  end

  it "does something useful" do
    # rhub = Rhubarb::Canon.new

    Rhubarb::Orator.persona

    expect(false).to eq(true)
  end
end
