class Book < ActiveRecord::Base
  attr_accessible :title

  has_many :subscriptions, :dependent => :destroy
  has_many :subscribers, :through => :subscriptions, :source => :user, :class_name => 'User'

  has_many :authorings
  has_many :authors, :through => :authorings, :source => :user, :class_name => 'User'

  has_many :favourites
  has_many :fans, :through => :favourites, :source => :user, :class_name => 'User'

  has_many :sections, dependent: :destroy

  validates :title, presence: true

  def written_by?(user)
    authorings.find_by_user_id(user.id)
  end
end
