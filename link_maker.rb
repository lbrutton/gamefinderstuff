def make_link(game)
	if game.type == "IosGame"
		link = "https://itunes.apple.com/app/id#{game.store_application_id}"
	else
		link = "https://play.google.com/store/apps/details?id=#{game.store_application_id}"
	end
	link
end
