class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        flash[:notice] = "User registration has been completed."
        @current_user = @user
        redirect_to root_path
      else
        render("users/new")
      end
  end

  def login

      @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        flash[:notice] = "Logged in"
        @@ids = @user.id
        session[:id] = @user.id
        redirect_to tasks_index_path
      else
        @error_message = "Your email or username is incorrect."
        @email = params[:email]
        @password = params[:password]
        render("users/login_form")
      end
  end

  private
    def user_params
      params.permit(:name, :email, :password, :password_confirmation)
    end
end
