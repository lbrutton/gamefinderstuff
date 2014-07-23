class LanguagesController < ApplicationController
	def english
		session[:language]=1
		redirect_to root_url #will need to change this to redirect to current page
	end

	def german
		session[:language]=6
		redirect_to root_url 
	end
end
