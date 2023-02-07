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
    @vinyl = Vinyl.create(vinyl_params)
    if @vinyl.save
      redirect_to vinyls_path(@vinyl)
    else
      render :new
    end
  end

  def destroy
    @vinyl.destroy
    redirect_to vinyls_path
  end

  private
  def list_params
    params.require(:vinyl).permit(:name)
  end
end

# /vinyls
# /vinyls/:id
# /vinyls/new
# /vinyls/:id/edit
# /vinyls/:id
