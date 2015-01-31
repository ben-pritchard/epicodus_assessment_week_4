###DESCRIPTION

This is an app for someone who wants to keep track of bands and what venues they have played at.

You will seriously be like: **"Duuude!"**

###SETUP INSTRUCTIONS

To set up the correct databases, you will have to create a database.yml file that has the following in it:

development:
adapter: postgresql
database: band_tracker_development
template: template0

test:
adapter: postgresql
database: band_tracker_test
template: template0

Also, be sure to migrate something like this:

class CreateTablesForBandsAndVenues < ActiveRecord::Migration
  def change
    create_table(:bands) do |t|
      t.column(:name, :string)

      t.timestamps
    end

    create_table(:venues) do |t|
      t.column(:name, :string)

      t.timestamps
    end

    create_table(:bands_venues) do |t|
      t.column(:band_id, :integer)
      t.column(:venue_id, :integer)

      t.timestamps
    end
  end

end


Make sure Sinatra is on stage with your app.rb. Then open a web browser and go to the corresponding local host:

*example: http://localhost:4567/*

###COPYRIGHT INFORMATION

GPL v2

###LICENSE INFORMATION

GPL v2

###AUTHOR

Ben Pritchard
