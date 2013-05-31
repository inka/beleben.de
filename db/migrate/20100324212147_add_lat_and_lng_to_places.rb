class AddLatAndLngToPlaces < ActiveRecord::Migration
  def self.up
    add_column "places", "lat", :decimal
    add_column "places", "lng", :decimal

    # run to initial set lat lng values
    # Place.all.each {|p| p.save}
  end

  def self.down
    remove_column "places", "lat", "lng"
  end
end
