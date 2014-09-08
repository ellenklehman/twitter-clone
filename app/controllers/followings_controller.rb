class FollowingsController < ApplicationController
  def create
    @followed = User.find(params[:followed_id])
    @following = current_user.followings.build(:followed_id => params[:followed_id], :user_email => current_user.email)
    if @following.save
      flash[:notice] = "Added follow."
      redirect_to root_url
    else
      flash[:error] = "Unable to follow."
      redirect_to root_url
    end
  end

def destroy
  @following = current_user.followings.find(params[:id])
  @following.destroy
  flash[:notice] = "Removed following."
  redirect_to current_user
end
end
