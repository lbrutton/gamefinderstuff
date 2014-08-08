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

	def current_platform #used to ensure that new sessions don't need to click on a platform to avoid 
		# raising an exception
		if session[:platform_type].nil?
			session[:platform_type] = IosGame
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

	def make_link(game)
		if game.type == "IosGame"
			link = "https://itunes.apple.com/app/id#{game.store_application_id}"
		else
			link = "https://play.google.com/store/apps/details?id=#{game.store_application_id}"
		end
	link
	end

end
