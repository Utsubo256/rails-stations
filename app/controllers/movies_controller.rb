class MoviesController < ApplicationController
  before_action :set_q, only: [:index, :search]
  def index
    @movies = Movie.all
  end

  def search
    @results = @q.result
  end

  private

    def set_q
      @q = Movie.ransack(params[:q])
    end
end
