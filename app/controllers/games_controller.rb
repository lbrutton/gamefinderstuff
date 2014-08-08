class GamesController < ApplicationController

	before_action :current_language
	before_action :current_platform

	def show_all
		games = Games.order(id: :desc).where(type: session[:platform_type])
		cleanup(games)
		@games = games.paginate(page: params[:page])
	end

	def show
		@game = Games.find_by(id:params[:id])
		@rating = @game.hitfox_rating_id
		@game_detail = GameDetails.find_by(game_id: @game.id, language_id: session[:language])
		@link = make_link(@game)
	end

	def index
		@results = Games.where(type: session[:platform_type]).search(params[:search])
	end

end
