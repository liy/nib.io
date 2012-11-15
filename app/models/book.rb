class Book < ActiveRecord::Base
  attr_accessible :title

  has_many :subscriptions, :dependent => :destroy
  has_many :subscribers, :through => :subscriptions, :source => :user, :class_name => "User"

  has_many :authorings
  has_many :authors, :through => :authorings, :source => :user, :class_name => "User"
end
