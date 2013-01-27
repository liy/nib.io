class BooksController < ApplicationController
  layout 'reading', only: [:show]
  layout 'writing', only: [:new, :edit]

  # browse all books
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  # Start writing a brand new book.
  # If you want to join to a existing book authoring, authorings_controller#create should be used.
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
    @book = Book.find(params[:id])

    if @book.update_attributes(params[:book])
      redirect_to @book, notice: 'The book was sucessfully updated.'
    else
      render 'edit', notice: @book.errors.full_messages
    end
  end

  def destroy
    book = Book.find(params[:id])
    user = book.authors[0]
    book.authoring.destroy
    book.destroy
    redirect_to user
  end
end
