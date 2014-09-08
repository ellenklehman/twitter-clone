class UsersController < ApplicationController
  before_filter :authorize, only: [:edit, :update, :show, :destroy]

  def index
    @users = User.all.order("email").page(params[:page]).per(5)
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @tweets = @user.followings.page(params[:page]).per(1)
  end

  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     binding.pry
  #     UserMailer.signup_confirmation(@user).deliver
  #     session[:user_id] = @user.id
  #     flash[:notice] = "User was added"
  #     redirect_to session_user_path(session, @user)
  #   else
  #     render 'new'
  #   end
  # end the devise controller is in effect

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @current_user.id == @user.id
      if @user.update(user_params)
        @user.update_attribute(:email, params[:user])
        flash[:notice] = "User updated."
        redirect_to session_user_path(session, @user)
      else
        render 'edit'
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @current_user.id == @user.id
      if @user.destroy
        current_user.destroy
        session[:user_id] = nil
        flash[:notice] = "The user was deleted."
        redirect_to root_path
      end
    end
  end



  private


  def authorize
    @user = User.find(params[:id])
    redirect_to login_url, alert: "Not authorized!" if current_user != @user
  end


    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
