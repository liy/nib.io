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
    # TODO: get all the books
    @books = @user.readings

    if current_user.id == @user.id
      render :home
    else
      render :show
    end
  end

  def writings
    @user = User.find_by_id(params[:user_id])
    if @user
      @books = @user.writings
    else
      @books = current_user.writings
    end
  end

  def readings
    @user = User.find_by_id(params[:user_id])
    if @user
      @books = @user.readings
    else
      @books = current_user.readings
    end
  end

  def likes
    @user = User.find_by_id(params[:user_id])
    if @user
      @books = @user.likes
    else
      @books = current_user.likes
    end
  end

  def subscribe

  end
end
