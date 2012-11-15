class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :name, :password, :remember_me
  # attr_accessible :title, :body

  # Users can subscribe books. If user is destroyed, his subscriptions will be removed as well.
  # has_many :subscriptions, :dependent => :destroy
  # has_many :readings, :through => :subscriptions, :source => :book

  # Users can write their own books as well. If user is destroyed, the books he authored will NOT be destroyed.
  # has_many :authorings
  # has_many :writings, :through => :authorings, :source => :book


  has_many :subscriptions, :dependent => :destroy
  has_many :readings, :through => :subscriptions, :source => :book, :class_name => "Book"

  has_many :authorings
  has_many :writings, :through => :authorings, :source => :book, :class_name => "Book"
end
