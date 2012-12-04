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
end
