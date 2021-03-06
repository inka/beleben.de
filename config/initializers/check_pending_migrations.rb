#---
# Excerpted from "Advanced Rails Recipes",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/fr_arr for more book information.
#---
unless defined?(Rake) # skip when run from tasks like rake db:migrate

  migrator = ActiveRecord::Migrator.new(:up, 'db/migrate')
  pending_migrations = migrator.pending_migrations

  if pending_migrations.any?
    abort "Database has #{pending_migrations.size} pending migrations"
  end

end
