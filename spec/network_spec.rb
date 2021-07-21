require './lib/network'
require './lib/show'
require './lib/character'

RSpec.describe Network do
  it "exists" do
    nbc = Network.new("NBC")

    expect(nbc).to be_an_instance_of(Network)
  end
end
