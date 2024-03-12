class PhotosController < ApplicationController
  before_action :set_photo, only: %i[ show edit update destroy ]
  before_action :ensure_current_user_is_owner, only: [:destroy, :update, :edit]
  #2 Run this authorization function before the show action is implemented. In order to show flash messages, we need to define the Pundit object Pundit::NotAuthorizedError in the application_controller.
  #3 (Btw, if we include Pundit in the application controller, we can use the authorize helper method to substitute this)
  before_action :ensure_user_is_authorized, only: [:show]

  # GET /photos or /photos.json
  def index
    @photos = Photo.all
  end

  # GET /photos/1 or /photos/1.json
  def show
    #3 Since this controller is inheriting from ApplicationController, we can now use the helper authorize to substitute for determining if a user has access to this action.
    authorize @photo
  end

  # GET /photos/new
  def new
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos or /photos.json
  def create
    @photo = Photo.new(photo_params)
    @photo.owner = current_user

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: "Photo was successfully created." }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1 or /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: "Photo was successfully updated." }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1 or /photos/1.json
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: root_url, notice: "Photo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_photo
    @photo = Photo.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def photo_params
    params.require(:photo).permit(:image, :comments_count, :likes_count, :caption, :owner_id)
  end

  #2 First we define a function that would determine if the user has authorization to the action show. We want this to return true in order to show the user they dont have access. We must also define the before_action above.
  #3 (This gets substituted out when we use the helper method: authorize)
  def ensure_user_is_authorized
    if !PhotoPolicy.new(current_user, @photo).show?
      raise Pundit::NotAuthorizedError, "not allowed"
    end
  end
end
