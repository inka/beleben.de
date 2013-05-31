# version
APP_VERSION = '2.0 (2010-03-24)'

SESSION_TIMEOUT = 60.minutes

# registration mailer
#ActionMailer::Base.delivery_method = :sendmail
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
    :address => "localhost",
    :port => 25,
    :domain => "beleben.de",
    #:authentication => :login,
    #:user_name => "benutzername",
    #:password => "passwort"
}

I18n.load_path += Dir[File.join(RAILS_ROOT, 'config', 'locales', '*.{rb,yml}')]
I18n.default_locale = "de"

# TODO: standard ruby? or rails or ActiveSupport? replace with default method
# Helper method
# LATER: Replace this if there already is a Ruby/Rails method.
class Hash
  def restrict keys
    keys.inject(self.class.new) do |h, key|
      h[key] = self[key] if self.key? key
      h
    end
  end
end

# monkey patch because of mongrel 1.1.5 bug in
#           headers.each { |k, vs|
#            vs.split("\n").each { |v|
#              response.header[k] = v
#            }
#          }
# vs can be a Fixnum and split on it would cause an error
# e.g. with the Expires=0 header
#
class Fixnum
  def split( splitter=nil )
    self.to_s.split(splitter)
  end
#  avoid passenger error:
#  *** Exception NoMethodError in application (undefined method `each' for 0:Fixnum) (process 28587):
#  from /opt/gems/gems/passenger-2.1.2/lib/phusion_passenger/rack/request_handler.rb:73:in `process_request'
  def each
    self
  end
end

# so avoid testing of exist before asking if it is empty
class NilClass
  def empty?
    return true
  end
end
