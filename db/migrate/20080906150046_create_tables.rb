# :users, :artists, :events, :posts
class CreateTables < ActiveRecord::Migration
    def self.up
        create_table "users", :force => true do |t|
            t.boolean   :is_admin                                   ,:null => false, :default => false
            t.string    :login,:name,:email,:remember_token
            t.string    :crypted_password,:salt,:activation_code    ,:limit => 40
            t.datetime  :remember_token_expires_at,:activated_at,:last_activity_at
            t.timestamps
        end

        create_table :sessions do |t|
          t.string :session_id, :null => false
          t.text :data
          t.timestamps
        end

=begin
        create_table "artists" do |t|
            t.integer :created_by, :null => false
            t.integer :lastchange_by, :null => false
            t.string :name, :contact_person, :url, :email
            t.text   :address, :description, :comment, :contact_data
            t.timestamps
        end

        create_table "events" do |t|
            t.column :created_by, :integer, :null => false
            t.column :lastchange_by, :integer, :null => false
            t.string :name, :contact_person, :url, :email
            t.text   :address, :description, :comment, :contact_data
            t.timestamps
        end
=end

        create_table "posts" do |t|
            t.string :title, :contact_person, :url, :email, :crypted_password, :salt, :category, :kind
            t.text   :address, :description, :comment
            t.integer :expire_days
            t.datetime :activated_at
            t.timestamps
        end

        # generic table for storing uploaded files
        # either uri (e.g. file:///var/www/data/expose.pdf) or binary data should be set
        # type is an app specific flexible marker (e.g. logo,expose,import,export)
        create_table "files" do |t|
            t.integer :user_id, :null => false
            t.integer :artist_id, :event_id, :post_id
            t.string  :filename, :type, :checksum, :uri, :comment, :content_type
            t.integer :size_in_bytes
            t.column  :data, :binary, :limit => 2.megabyte
            t.timestamps
        end

        create_table :contacts do |t|
          t.string :salutation
          t.string :name
          t.string :email
          t.text :message

          t.timestamps
        end
    end

    def self.down
        [:users, :sessions, :artists, :events, :posts, :files, :kontakts
        ].each do |table|
            begin
                drop_table table
            rescue => boom
                puts boom
            end
        end
    end
end
