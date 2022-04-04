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

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to admin_movies_path
    else
      flash[:alert] = '入力内容に誤りがあります'
      redirect_to edit_admin_movie_path
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = '削除が完了しました'
    redirect_to admin_movies_path
  end

  private

    def movie_params
      params.require(:movie).permit(:name, :year, :is_showing, :description, :image_url)
    end
end
