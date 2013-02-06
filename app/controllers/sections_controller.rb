class SectionsController < ApplicationController
  # show index of the book
  def index
    @book = Book.find(params[:book_id])
  end

  # show a specific section of a book
  def show
    @section = Section.find(params[:id])
    render json: @section
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  # handled with care!
  def destroy
  end
end
