class PostsController < ApplicationController
  # GET /posts
  # GET /posts.xml
  def index
#    @posts = Post.find(:all, :order => 'updated_at DESC').slice(0..20)
    @posts = Post.paginate_by_kiez(get_kiez, :page => params[:page], :order => 'updated_at DESC')

    respond_to do |format|
      format.html { render :template => "posts/index" }
      format.xml  { render :xml => @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    @posts = Post.find_all_by_kiez(get_kiez, :order => 'updated_at DESC')
    @post = Post.find_by_kiez_and_id(get_kiez, params[:id])

    respond_to do |format|
      format.html { render :template => "posts/show" }
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    @posts = Post.find(:all, :order => 'updated_at DESC')
    @post = Post.new
    @post.title = "Überschrift*"

    respond_to do |format|
      format.html { render :template => "posts/new" }
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @posts = Post.find(:all, :order => 'updated_at DESC')
    @post = Post.find(params[:id])
    render(:action => :new)
  end

  # POST /posts
  # POST /posts.xml
  def create
    @posts = Post.find_all_by_kiez(get_kiez, :order => 'updated_at DESC')
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        flash[:notice] = 'Die Anzeige wurde erfolgreich erstellt.'
        puts @post.inspect
        ContactMailer.deliver_notify(@post)
        format.html { redirect_to(@post) }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @posts = Post.find(:all, :order => 'updated_at DESC')
    @post = Post.find(params[:id])

    p = params[:post][:password]
    params[:post].delete('password')
    params[:post].delete('password_confirmation')
    if admin? || @post.authenticated?(p)
      if params['delete']
        if @post.destroy
          flash[:notice] = 'Anzeige wurde gelöscht'
        end
      else
        if @post.update_attributes(params[:post])
          ContactMailer.deliver_notify(@post)
          flash[:notice] = 'Anzeige wurde erfolgreich aktualisiert'
        end
      end
      respond_to do |format|
        format.html { redirect_back_or_default(nice_posts_url) }
        format.xml  { head :ok }
      end
    else
      flash[:error] = 'Passwort ist leider nicht korrekt! Bitte korrigieren Sie ihre Angabe.' if !@post.authenticated?(p)
      respond_to do |format|
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  rescue          
    raise if RAILS_ENV == 'development'
    flash[:error] = "Es ist ein Fehler aufgetreten."
    respond_to do |format|
      format.html { render :action => "new" }
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end
end

class Schillerpromenade::PostsController < PostsController  
end
class Moabitwest::PostsController < PostsController
end