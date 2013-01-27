class Book < ActiveRecord::Base
  attr_accessible :title

  has_many :subscriptions, :dependent => :destroy
  has_many :subscribers, :through => :subscriptions, :source => :user, :class_name => "User"

  has_many :authorings
  has_many :authors, :through => :authorings, :source => :user, :class_name => "User"

  has_many :favourites
  has_many :fans, :through => :favourites, :source => :user, :class_name => "User"

  has_many :users

  validates :title, presence: true

  has_many :favourites, :dependent => :destroy
end
