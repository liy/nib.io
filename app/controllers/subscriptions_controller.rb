class SubscriptionsController < ApplicationController
  def index
    
  end

  def show
    
  end

  # add a book subscription.
  def create
    @book = Book.find(params[:book_id])
    current_user.subscribe!(@book)
    respond_to do |format|
      # format.html
      format.js { render 'toggle' }
    end
  end

  def destroy
    @subscription = current_user.subscriptions.find_by_id(params[:id])
    @book = @subscription.book
    current_user.unsubscribe!(@book)
    respond_to do |format|
      # format.html
      format.js { render 'toggle' }
    end
  end
end
