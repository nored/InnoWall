class WallsController < ApplicationController
  before_action :set_wall, only: [:show, :edit, :update, :destroy]

  # GET /walls
  # GET /walls.json
  def index
    @walls = Wall.all
  end

  def url
    redirect_to "/#{params[:url]}"
  end

  def search
    if @wall.nil?
      redirect_to action: "new"
    else
      redirect_to action: "show",:id => wall.id
    end
  end

  # GET /walls/1
  # GET /walls/1.json
  def show
    if @wall.nil?
      redirect_to action: "new"
    else
      @pictures = @wall.pictures.all
      @videos = @wall.videos.all
      @texts = @wall.texts.all
      @ownertoken = @wall.ownertoken
      @foo = @wall.delete_after
    end
  end

  # GET /walls/new
  def new
    @cancel_wall = "/"
    @wall = Wall.new(:url => session[:url])
  end

  # GET /walls/1/edit
  def edit
    @cancel_wall = "/#{@wall.url}"
  end

  def set_owner(delete_after, url)
    delete_after = delete_after.empty? ? 300 : Integer(delete_after)
    token = SecureRandom.hex(30)
    cookies[:ownertoken] = {:value => token, :expires => Time.now + Integer(delete_after)}
    @wall.update(ownertoken: token)
  end

  # POST /walls
  # POST /walls.json
  def create
    @wall = Wall.new(wall_params)
    respond_to do |format|
      if @wall.save
        set_owner(params[:wall][:delete_after], params[:wall][:url])
        format.html { redirect_to "/#{params[:wall][:url]}", notice: 'Wall was successfully created.' }
        format.json { render :show, status: :created, location: "/#{params[:wall][:url]}" }
      else
        format.html { render :new }
        format.json { render json: @wall.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /walls/1
  # PATCH/PUT /walls/1.json
  def update
    respond_to do |format|
      if @wall.update(wall_params)
        format.html { redirect_to "/#{@wall.url}", notice: 'Wall was successfully updated.' }
        format.json { render :show, status: :ok, location: "/#{params[:wall][:url]}" }
      else
        format.html { render :edit }
        format.json { render json: @wall.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /walls/1
  # DELETE /walls/1.json
  def destroy
    @wall.destroy
    respond_to do |format|
      format.html { redirect_to "/", notice: 'Wall was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wall
      session[:url] = params[:url]
      if params[:id].nil?
        @wall = Wall.find_by(url: params[:url])
      else
        @wall = Wall.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wall_params
      params.require(:wall).permit(:url, :delete_after, :allow_pictures, :allow_videos, :allow_text, :restrict_location, :latitude, :longitude)
    end
end
