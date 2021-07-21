require './lib/character'

RSpec.describe Character do
  it "exists" do
    kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})

    expect(kitt).to be_a(Character)
  end
end
