class VinylsController < ApplicationController
  before_action :set_vinyl, except: [:index, :new, :create]

  def index
    @vinyls = Vinyl.all
  end

  def show
  end

  def new
    @vinyl = Vinyl.new
  end

  def create
    @vinyl = Vinyl.new(vinyl_params)
    @vinyl.user = current_user
    @vinyl.available = true
    if @vinyl.save
      redirect_to vinyls_path, status: :see_other
    else
      render :new
    end
  end

  def edit
  end

  def update
    @vinyl.update(vinyl_params)
    redirect_to vinyl_path(@vinyl)
  end

  def destroy
    @vinyl.destroy
    redirect_to vinyls_path, status: :see_other
  end

  private

  def vinyl_params
    params.require(:vinyl).permit(:artist, :release_year, :record_title, :label, :genre, :quality, :price_per_day)
  end

  def set_vinyl
    @vinyl = Vinyl.find(params[:id])
  end
end

# /vinyls
# /vinyls/:id
# /vinyls/new
# /vinyls/:id/edit
# /vinyls/:id
