#Pages_controller is a ruby controller used to store functions for use throughout the application specific to Pages tasks

class PagesController < ApplicationController

  skip_authorization_check

  def home
    @current_nav_identifier = :home
  end

end
