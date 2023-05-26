class MoviesController < ApplicationController

  def index
    @lists = Movie.all
  end

  def show
    @lists = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(params_list)
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
