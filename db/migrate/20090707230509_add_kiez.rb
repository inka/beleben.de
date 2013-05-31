class AddKiez < ActiveRecord::Migration
  def self.up
    add_column :contacts, :kiez, :string
    Contact.all.each{|c| c.update_attribute(:kiez, "schillerpromenade") if c.kiez.blank? }
    add_column :posts, :kiez, :string
    Post.all.each{|p| p.update_attribute(:kiez, "schillerpromenade") if p.kiez.blank? }
  end

  def self.down
    remove_column :posts, :kiez
    remove_column :contacts, :kiez
  end
end
