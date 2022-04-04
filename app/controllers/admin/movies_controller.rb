class Admin::MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to admin_movies_path
    else
      flash[:alert] = '入力内容に誤りがあります'
      redirect_to new_admin_movie_path
    end
  end

  private

    def movie_params
      params.require(:movie).permit(:name, :year, :is_showing, :description, :image_url)
    end
end
