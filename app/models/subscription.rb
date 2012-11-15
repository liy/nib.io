class Subscription < ActiveRecord::Base
  attr_accessible :book_id, :user_id, :expire_at

  belongs_to :user
  belongs_to :book
end
