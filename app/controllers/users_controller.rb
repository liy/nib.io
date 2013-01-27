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

  # TODO: refine user information!
  def show
    @user = User.find(params[:id])
    @books = Book.all
    if current_user.id == @user.id
      render :home
    else
      render :show
    end
  end

  # display all the writings of given user
  def writings
    @user = User.find(params[:id])
    @books = @user.writings
  end

  # display all the readings of given user
  def readings
    @user = User.find(params[:id])
    @books = @user.readings
  end

  # display all the favourite books of given user
  def likes
    @user = User.find(params[:id])
    @books = @user.likes
  end
end
