class ApplicationController < ActionController::Base
  protect_from_forgery

  def token
    ENV['VTOKEN']
  end
end
