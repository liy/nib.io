class Section < ActiveRecord::Base
  attr_accessible :content, :title

  belongs_to :book

  before_validation :generate_slug
  validates :title, uniqueness: true, presence: true

  def to_param
    slug
  end

private
  def generate_slug
    self.slug ||= title.parameterize
  end
end
