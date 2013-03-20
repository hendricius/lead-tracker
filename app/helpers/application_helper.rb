module ApplicationHelper

  def notices?
    flash[:notice] || flash[:alert] || flash[:error]
  end

  def token
    ENV['VTOKEN']
  end
end
