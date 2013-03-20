class StaticController < ApplicationController
  respond_to :html
  def home
    render "home", layout: "public"
  end
end
