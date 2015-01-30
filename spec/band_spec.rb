require("spec_helper")

describe(Band) do
  it { should have_and_belong_to_many(:venues) }

  it("validates the presence of name") do
    new_band = Band.new({:name => ""})
    expect(new_band.save()).to(eq(false))
  end

  it("makes sure the name is capitalized when it is saved") do
    new_band = Band.create({:name => "new jammers"})
    expect(new_band.name()).to(eq("New jammers"))
  end

end
