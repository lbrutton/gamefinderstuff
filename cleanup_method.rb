def cleanup(games)
	games_array = games.to_a #turn the active record relation into an array, so that 'delete' works
	games_array.each do |game|
		game_details = GameDetails.find_by(game_id: game.id, language_id: 1)
		unless game_details.nil?
			if game_details.review.blank?
				games_array.delete(game)
			end
		end
	end
end

