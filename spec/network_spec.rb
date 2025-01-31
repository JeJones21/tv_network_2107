require './lib/network'
require './lib/show'
require './lib/character'

RSpec.describe Network do
  it "exists" do
    nbc = Network.new("NBC")

    expect(nbc).to be_an_instance_of(Network)
  end

  it "has readable attributes" do
    nbc = Network.new("NBC")

    expect(nbc.name).to eq("NBC")
    expect(nbc.shows).to eq([])
  end

  it "adds shows and characters to the network" do
    nbc = Network.new("NBC")
    michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])
    leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
    ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
    parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [leslie_knope, ron_swanson])

    nbc.add_show(knight_rider)
    nbc.add_show(parks_and_rec)

    expect(nbc.shows).to eq([knight_rider, parks_and_rec])
  end

  xit "can determine the main character" do
    nbc = Network.new("NBC")
    michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])
    leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
    ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
    parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [leslie_knope, ron_swanson])

    nbc.add_show(knight_rider)
    nbc.add_show(parks_and_rec)

    expect(nbc.main_characters).to eq([kitt])
  end

  it "can list actors by show" do
    nbc = Network.new("NBC")
    michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])
    leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
    ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
    parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [leslie_knope, ron_swanson])

    nbc.add_show(knight_rider)
    nbc.add_show(parks_and_rec)

    expected = {
      "knight_rider" => ["David Hasselhoff", "William Daniels"],
      "parks_and_rec" => ["Amy Poehler", "Nick Offerman"]
    }
    expect(nbc.actors_by_show).to eq(expected)
  end
end
