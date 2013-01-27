#coding: utf-8
class FavouritesController < ApplicationController
  def index
    # @user = User.find(params[:user_id])
    render json: params
  end

  def create
    # render text: params
    @book = Book.find(params[:book_id])
    current_user.like!(@book)
    respond_to do |format|
      format.html
      format.js {  render 'toggle' }
    end
  end

  def destroy
    @fav = Favourite.find(params[:id])
    @book = @fav.book
    current_user.unlike!(@book)
    respond_to do |format|
      format.html
      format.js {  render 'toggle' }
    end
  end
end