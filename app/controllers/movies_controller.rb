class MoviesController < ApplicationController

  def index
    @lists = movie.all
  end

  def show
    @lists = movie.find(params[:id])
  end

  def new
    @movie = movie.new
  end

  def create
    @movie = movie.new(params_list)
    @movie.save
    if @movie.save
      redirect_to list_path(@movie)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def params_list
    params.require(:movie).permit(:name)
  end
end
