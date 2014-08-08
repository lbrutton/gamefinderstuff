class PlatformsController < ApplicationController

  def ios
  	session[:platform_type]=IosGame
  	redirect_to root_url
  end

  def android
  	session[:platform_type]=AndroidGame
  	redirect_to root_url
  end
  
end
