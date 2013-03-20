class SignupsController < ApplicationController
  before_filter :authorize, :except => [:create, :new]

  def index
    @signups = Signup.order('created_at DESC').all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @signups }
    end
  end

  def new
    @signup = Signup.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @signup }
    end
  end

  def create
    @signup = Signup.new(params[:signup])
    @signup.ip = request.remote_ip
    @signup.country = request.location.country
    respond_to do |format|
      if @signup.save
        format.html { redirect_to root_url, notice: "Thank you. We will get back to you soon. <script>_gaq.push(['_trackPageview', '/register_success']);</script>".html_safe }
        format.json { render json: @signup, status: :created, location: @signup }
      else
        format.html {
          flash[:alert] = "Sorry, that email has already been taken/is invalid. Please try again."
          redirect_to root_path
        }
        format.json { render json: @signup.errors, status: :unprocessable_entity }
      end
    end
  end

  def token_valid?
    params[:token] == token
  end

  def authorize
    if !token_valid?
      flash[:alert] = "Sorry, you may not access this"
      redirect_to root_path
      return false
    end
  end

  def destroy
    @signup = Signup.find(params[:id])
    @signup.destroy
    respond_to do |format|
      format.html { redirect_to signups_path(token: token), notice: "Deleted successfully" }
      format.json { head :no_content }
    end
  end

  def toggle_contacted
    @signup = Signup.find(params[:id])
    @signup.toggle_contacted
    if @signup.save
      redirect_to signups_path(token: token), notice: 'Signup successfully updated.'
    else
      flash[:alert] = "Couldn't update signup"
      redirect_to signups_path(token: token)
    end
  end


end
