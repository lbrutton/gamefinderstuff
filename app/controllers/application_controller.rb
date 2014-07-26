class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	def current_language #used to ensure that new sessions don't need to click on a language to avoid 
		# raising an exception
		if session[:language].nil?
		session[:language] = 1
		end
	end

	def cleanup(games)
		games.each do |game| 
			game_details = GameDetails.find_by(game_id: game.id, language_id: 1)
			if game_details.nil? #some games seem to have empty game_details, this removes them before the next block,
				#and avoids raising an exception
				games.delete(game)
			else 
				if game_details.review.blank?
					games.delete(game)
				end
			end
		end
	end

end
