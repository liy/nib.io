#coding: utf-8
class FavouritesController < ApplicationController
  def new

  end

  def create
    # render text: params
    @book = Book.find(params[:book_id])
    current_user.like!(@book)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit

  end

  def update

  end

  def destroy
    @book = Favourite.find(params[:id]).book
    current_user.unlike!(@book)
    respond_to do |format|
      format.html
      format.js
    end
  end
end