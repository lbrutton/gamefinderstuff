class GamesController < ApplicationController

	before_action :current_language

	def show_all
		games = Games.all
		cleanup(games)
		@games = games.paginate(page: params[:page])
	end

	def show
		@game = Games.find_by(id:params[:id])
		@game_detail = GameDetails.find_by(game_id: @game.id, language_id: session[:language])
	end

end
