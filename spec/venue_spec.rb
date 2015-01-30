require("spec_helper")

describe(Venue) do
  it { should have_and_belong_to_many(:bands) }

  it("validates the presence of name") do
    new_venue = Venue.new({:name => ""})
    expect(new_venue.save()).to(eq(false))
  end

  it("makes sure the first letter of the venue is capitalized") do
    new_venue = Venue.create({:name => "rose garden"})
    expect(new_venue.name()).to(eq("Rose garden"))
  end
end
