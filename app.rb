require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get("/") do
  @bands = Band.all()
  erb(:index)
end

get("/bands/:id") do
  @band = Band.find(params.fetch("id").to_i())
  erb(:band)
end

get("/edit/:id") do
  id = params.fetch("id").to_i()
  @band = Band.find(id)
  erb(:edit_band)
end

patch("/update") do
  id = params.fetch("id").to_i()
  name = params.fetch("name")
  Band.find(id).update({:name => name})
  redirect("/")
end

get("/delete/:id") do
  id = params.fetch("id").to_i()
  Band.find(id).destroy()
  redirect("/")
end

get("/bands") do
  @venues = Venue.all()
  erb(:add_band)
end

post("/bands") do
  band_name = params.fetch("band_name")
  venue_ids = params.fetch("venue_ids")
  @band = Band.create({:name => band_name, :venue_ids => venue_ids})
  redirect("/")
end

post("/venues") do
  venue_name = params.fetch("venue_name")
  Venue.create({:name => venue_name})
  redirect("/bands")
end
