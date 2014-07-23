class GamesController < ApplicationController

	def show_all
		@games = Games.paginate(page: params[:page])

	end

	def show
		@game = Games.find_by(id:params[:id])
		@game_detail = GameDetails.find_by(game_id: @game.id, language_id: session[:language])
	end

end
