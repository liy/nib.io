class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :password

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true,
                    :format => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }


  has_many :subscriptions, :dependent => :destroy
  has_many :readings, :through => :subscriptions, :source => :book, :class_name => "Book"

  has_many :authorings
  has_many :writings, :through => :authorings, :source => :book, :class_name => "Book"

  has_many :favourites, :dependent => :destroy

  def liked?(book)
    favourites.find_by_book_id(book.id)
  end

  def like!(book)
    favourites.create!(book_id: book.id)
  end

  def unlike!(book)
    favourites.find_by_book_id!(book.id).destroy
  end

  def subscribe!(book)
    subscriptions.create!(book_id: book_id)
  end

  def subscribed?(book)

  end

  def is_author?(book)

  end
end
