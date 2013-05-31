#---
# Excerpted from "Advanced Rails Recipes",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/fr_arr for more book information.
#---
unless defined?(Rake) # skip when run from tasks like rake db:create
  DATABASE_ENCODING = "utf8" unless defined? DATABASE_ENCODING

  variables = %w(character_set_database
                 character_set_client
                 character_set_connection)

  begin
    ActiveRecord::ConnectionAdapters::MysqlAdapter
    variables.each do |v|
      ActiveRecord::Base.connection.
          execute("SHOW VARIABLES LIKE '#{v}'").each do |r|
        unless r[1] == DATABASE_ENCODING
          abort "Please set your #{r[0]} variable to '#{DATABASE_ENCODING}'."
        end
      end
    end
  rescue NameError
    #puts "no mysql backend to test encoding"
  end
end