require 'pry'
class BillboardsController < ApplicationController
  def index
    @billboards = Billboard.all
  end

  def show
    @billboard = Billboard.find(params[:id])

  end

  def new
    @billboard = Billboard.new
  end

  def create
    @billboard = Billboard.new(billboard_params)
    if @billboard.save
      redirect_to billboard_path(@billboard)
    else
      render :new
    end
  end

  def edit
    @billboard = Billboard.find(params[:id])
  end

  def update
    @billboard = Billboard.find(params[:id])
    if @billboard.update(billboard_params)
      redirect_to billboard_path(@billboard)
    else
      render :edit
    end
  end

  def destroy
    @billboard = Billboard.find(params[:id])
    @billboard.destroy
    redirect_to billboards_path
  end  

  def add
    binding.pry

    # @billboard = 
    # song = 
  end
  

  private

    def billboard_params
      params.require(:billboard).permit(:name)
    end
end
