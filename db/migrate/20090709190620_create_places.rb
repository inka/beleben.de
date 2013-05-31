class CreatePlaces < ActiveRecord::Migration
  def self.up
    create_table :places do |t|
      t.column :lastchange_by, :integer, :null => false
      t.string :title, :address, :kiez
      t.text :description
      t.decimal :size, :price, :price2, :totalprice
      t.string :url, :email, :phone
      t.timestamps
    end
  end

  def self.down
    drop_table :places
  end
end
