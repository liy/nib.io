class BooksController < ApplicationController
  # browse all books
  def index
    @books = Book.all
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

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    begin
      @book = current_user.writings.create!(params[:book])
    rescue Exception => e
      render 'new', flash: { error: @book.errors.full_messages }
    end

    redirect_to @book
  end

  def edit
  end

  def update

  end

  def destroy
    book = Book.find(params[:id])
    user = book.authors[0]
    book.authoring.destroy
    book.destroy
    redirect_to user
  end
end
