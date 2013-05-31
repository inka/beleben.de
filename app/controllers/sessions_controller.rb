# This controller handles the login/logout function of the site.  
class SessionsController < ApplicationController

  skip_before_filter :login_required, :check_expo, :update_last_activity, :verify_authenticity_token

  filter_parameter_logging :password  # important!

#  layout 'login'

#  log :@current_user

  def new
    do_logout
    if User.count.zero?
      redirect_to :action => :signup_as_admin
      return
    end

    return unless request.post?

    @login = params[:login]  # remember login
    self.current_user = User.authenticate(params[:login], params[:password])
    if logged_in?
      if params[:remember_me] == "1"
        self.current_user.remember_me
        cookies["auth_token"] = {
            :value => self.current_user.remember_token,
            :expires => self.current_user.remember_token_expires_at
        }
      end
      current_user.update_attribute(:last_activity_at, Time.now)
      logger.debug current_user.inspect
#      if expo = current_user.active_expo
#        redirect_back_or_default :controller => '/expo', :action => :board, :id => expo
#      else
#        redirect_back_or_default :controller => '/expo', :action => :list
#      end
      flash[:success] = "\"#{current_user.name+' ('+@login+')'}\" erfolgreich angemeldet."
    else
      flash[:error] = 'Falscher Name oder falsches Passwort.'
#      redirect_to '/' if RAILS_ENV != 'development'
    end
    redirect_back_or_default '/'
  end

  def form
    render :action => "form", :layout => false
  end

  def destroy
    if logged_in?
#      current_user.active_expo = active_expo
#      current_user.save!
      self.current_user.forget_me if logged_in?
      cookies.delete :auth_token
      do_logout
      flash[:success] = "Benutzer \"#{@login}\" erfolgreich abgemeldet."
#    flash[:notice] = "You have been logged out."
    end        
    reset_session
    redirect_to('/')
  end

  def signup_as_admin
    access_denied unless User.count.zero?
    @user = User.new(params[:user])
    return unless request.post?
    @user.activate
    if @user.save
      self.current_user = @user
#      redirect_to :controller => 'expo'
      redirect_back_or_default('/')
      flash[:success] = "Sie sind jetzt angemeldet als \"#{current_user.login}\"."
    end
  end

  protected

  def do_logout
    if logged_in?
      @login = current_user.login
      current_user.forget_me
      # disabled the write token authorization
      # current_user.current_expo = nil
    end
    cookies.delete :auth_token
#    session[:return_to] = nil if %w[/login,/logout,/signup].find{|a| a == session[:return_to]}
#    reset_session
  end

end
