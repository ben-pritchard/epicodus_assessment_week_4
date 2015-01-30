require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get("/") do
  @bands = Band.all()
  erb(:index)
end

post("/bands") do
  name = params.fetch("name")
  @band = Band.create({:name => name})
  erb(:edit_band)
end

patch("/update") do
  id = params.fetch("id").to_i()
  name = params.fetch("name")
  Band.find(id).update({:name => name})
  redirect("/")
end
