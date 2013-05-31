class PlacesController < ApplicationController

  before_filter :login_required, :except => [:index]
  
  # GET /places
  # GET /places.xml
=begin
  def index
    @places = Place.find_all_by_kiez(get_kiez, :order => 'title ASC')

    respond_to do |format|
      format.html { render :template => "places/index" }
      format.xml  { render :xml => @places }
    end
  end
=end

  # GET /places
  # GET /places.xml
  def index
#    @places = Place.find(:all, :order => 'title ASC')
#    @places = Place.paginate(:all, :page => params[:page], :order => 'title ASC', :per_page => 8)
    #opts= Place.find_options_for_find_tagged_with(params[:tag])
    opts= {:conditions => ["kiez=?",get_kiez]}
    if params[:page]=='all'
      per_page = 100
      page = 1
    else
      per_page = 12
      page = params[:page] if params[:page]
    end
    order = 'title ASC'
    order = 'title DESC' if params[:order]=='title_dsc'
    @places= Place.paginate(:all, opts.merge(:page => page, :order => order, :per_page => per_page))
    #@tag = Tag.find_by_name(params[:tag]) if params[:tag]
    @order = params[:order] if params[:order]
    #readtags

    respond_to do |format|
      format.html { render :template => "places/index" }
      format.xml  { render :xml => @places }
    end
  end

                                       
  # GET /places/1
  # GET /places/1.xml
  def show
    @place = Place.find(params[:id])

    respond_to do |format|
      format.html { render :template => "places/show" }
      format.xml  { render :xml => @place }
    end
  end

  # GET /places/new
  # GET /places/new.xml
  def new
    @place = Place.new

    respond_to do |format|
      format.html { render :template => "places/new" }
      format.xml  { render :xml => @place }
    end
  end

  # GET /places/1/edit
  def edit
    @place = Place.find(params[:id])
    respond_to do |format|
      format.html { render :template => "places/edit" }
      format.xml  { render :xml => @place }
    end
  end

  # POST /places
  # POST /places.xml
  def create
    @place = Place.new(params[:place])
    @pictures = Array.new << Picture.new(:uploaded_data => params[:img_file]) if params[:img_file]
    # add the several pictures here
    # @pictures << Picture.new(:uploaded_data => params[:img_file1])
    # @pictures << Picture.new(:uploaded_data => params[:img_file2])
    @place.lastchange_by = current_user

    @service = PlaceService.new(@place, @pictures)

    respond_to do |format|
      if @service.save
        flash[:notice] = 'Place was successfully created.'
        format.html { redirect_to(@place) }
        format.xml  { render :xml => @place, :status => :created, :location => @place }
      else
        format.html { render :action => :new }
        format.xml  { render :xml => @place.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /places/1
  # PUT /places/1.xml
  def update
    @place = Place.find(params[:id])
    @pictures = @place.pictures
    @place.lastchange_by = current_user

    @service = PlaceService.new(@place, @pictures)

    respond_to do |format|
      if @service.update_attributes(params[:place], [params[:img_file]])
#                                    , params[:img_file1]
#                                    , params[:img_file2]])
        flash[:notice] = 'Place was successfully updated.'
        format.html { redirect_to(@place) }
        format.xml  { head :ok }
      else
        flash[:error] = 'Place update failed.'
        @pictures = @service.pictures
        format.html { render :action => :edit }
        format.xml  { render :xml => @place.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.xml
  def destroy
    @place = Place.find(params[:id])
    @place.destroy

    respond_to do |format|
      format.html { redirect_to(places_url) }
      format.xml  { head :ok }
    end
  end
end

class Schillerpromenade::PlacesController < PlacesController
end
class Moabitwest::PlacesController < PlacesController
end
