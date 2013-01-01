class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, notice: "Signed up"
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])

    if current_user.id == @user.id
      render :home
    else
      render :show
    end
    # render text: @user.writings[0].to_yaml
  end
end
