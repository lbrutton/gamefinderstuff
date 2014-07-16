class GameDetailsController < ApplicationController
	def show
		@firstgame = GameDetails.all
	end
end
