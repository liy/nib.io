class BooksController < ApplicationController
  layout :books_layout

  def index
    @books = Book.all
  end

  # This action will show the summery information of the book, such as the summery of the book, authors and pictures. For brief overview only.
  # To obtain the index of the book, use SectionsController#index. Since the sections is nested into the Book resource.
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
      render 'new', error: @book.errors.full_messages
    end

    redirect_to @book
  end

  def edit
  end

  def update
    @book = Book.find(params[:id])

    if @book.update_attributes(params[:book])
      redirect_to @book, notice: 'The book was successfully updated.'
    else
      render 'edit', notice: @book.errors.full_messages
    end
  end

  def destroy
    # @book = Book.find(params[:id])
    # redirect_to @book, notice: 'The book can not be destroyed!'

    a = 'This is a simple test'
    b = 'This is a very simple est'

    render json: Diff::LCS.diff(a, b)
  end

  def fans
    @book = Book.find(params[:id])
    # render json: @book.fans
  end

  def subscribers
    @book = Book.find(params[:id])
    # render json: @book.subscribers
  end


  private
    # choose the correct book layout
    def books_layout
      if params[:action] == 'show'
        'reading'
      elsif params[:action] == 'edit' || params[:action] == 'new'
        'writing'
      else
        'application'
      end
    end
end
