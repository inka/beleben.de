# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
class ApplicationController < ActionController::Base

  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  # protect_from_forgery :secret => '3e43f269268ef69827621e04827b75de'

  # See ActionController::Base for details
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password").
  filter_parameter_logging :password

  # Pick a unique cookie name to distinguish our session data from others'
#  session :session_key => '_KK_SID_'

  # be sure to include AuthenticatedSystem so current_user can be used in every controller
  include AuthenticatedSystem
  # If you want "remember me" functionality, add this before_filter to Application Controller
  #  before_filter :login_from_cookie
  # before_filter :login_required

  # Let all controllers use the Logging system.
  # include Logging

  before_filter :get_id, :update_last_activity

  # The id of the currently selected list item (as Integer).
  attr_accessor :id

  # choose layout: disable global for all xhr request (AJAX), kiez specific name
  layout proc{ |c| c.request.xhr? ? false : c.get_kiez }

  def get_kiez
   @kiez ||= params[:kiez] ? params[:kiez].to_s : params[:controller].index("/") ? params[:controller].split("/")[0] : 'moabitwest'
#    @kiez ||= params[:kiez] ? params[:kiez].to_s : params[:controller].index("/") ? params[:controller].split("/")[0] : 'schillerpromenade'
  end
    
protected
  # Returns the id parameter as Integer if given, and nil otherwise.
  def get_id
    @id ||= params[:id] ? params[:id].to_i : nil
  end

  def admin?
    # Check if the current user is administrator.
    return logged_in? && current_user.is_admin?
  end

  def no_cache
    response.headers["Last-Modified"] = Time.now.httpdate
    response.headers["Expires"] = 0
    # HTTP 1.0
    response.headers["Pragma"] = "no-cache"
    # HTTP 1.1 ‘pre-check=0, post-check=0′ (IE specific)
    response.headers["Cache-Control"] = "no-store, no-cache, must-revalidate, max-age=0, pre-check=0, post-check=0"
  end

  private
  def utf8_header
    response.headers["Content-Type"] = "text/html; charset=utf-8"
    # Set connection charset. MySQL 4.0 doesn't support this so it
    # will throw an error, MySQL 4.1 needs this
    suppress(ActiveRecord::StatementInvalid) do
      ActiveRecord::Base.connection.execute 'SET NAMES UTF8'
    end
  end
  def update_last_activity
    if logged_in?
      if current_user.last_activity_at && current_user.last_activity_at < Time.now.utc - SESSION_TIMEOUT
        store_location
        flash[:notice] = 'Sitzung ist abgelaufen. Bitte neu einloggen.'
        redirect_to '/login'
      else
        current_user.update_attribute(:last_activity_at, Time.now)
      end
    end
  end
end
