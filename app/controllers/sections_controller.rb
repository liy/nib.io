class SectionsController < ApplicationController
  before_filter :find_section, only: [:show, :edit, :update, :destroy]

  # show index of the book
  def index
    @book = Book.find(params[:book_id])
  end

# show a specific section of a book
  def show
  end

  def new
    @book = Book.find(params[:book_id])
    @section = @book.sections.build
  end

  def create
    @book = Book.find(params[:book_id])
    @section = @book.sections.create(params[:section])

    redirect_to @book
  end

  def edit

  end

  def update
    if @section.update_attributes!(params[:section])
      redirect_to book_path @book
    else
      render 'edit'
    end
  end

  # handled with care!
  def destroy
    @section.destroy
  end

private
  def find_section
    @book = Book.find(params[:book_id])
    @section = Section.find_by_slug!(params[:id])
  end
end
