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

delete("/delete/:id") do
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
  @band = Band.new({:name => band_name, :venue_ids => venue_ids})
  if @band.save()
    redirect("/")
  else
    erb(:error_band)
  end
end

post("/venues") do
  venue_name = params.fetch("venue_name")
  @venue = Venue.new({:name => venue_name})
  if @venue.save()
    redirect("/bands")
  else
    erb(:error_venue)
  end
end
