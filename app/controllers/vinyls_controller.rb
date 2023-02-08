class VinylsController < ApplicationController
  def index
    @vinyls = Vinyl.all
  end

  def show
    @vinyl = Vinyl.find(params[:id])
  end

  def new
    @vinyl = Vinyl.new
  end

  def create
    @vinyl = Vinyl.new(vinyl_params)
    @vinyl.user = current_user
    if @vinyl.save
      redirect_to vinyls_path
    else
      render :new
    end
  end

  def destroy
    @vinyl.destroy
    redirect_to vinyls_path
  end

  private

  def vinyl_params
    params.require(:vinyl).permit(:artist, :release_year, :record_title, :label, :genre, :quality, :price_per_day)
  end
end

# /vinyls
# /vinyls/:id
# /vinyls/new
# /vinyls/:id/edit
# /vinyls/:id
