class Section < ActiveRecord::Base
  attr_accessible :content, :title

  belongs_to :book

  extend FriendlyId
  # FriendlyId will look for a slug column in the table
  friendly_id :title, use: [:slugged, :history, :scoped], :scope => :book

  # Just use normal string
  def normalize_friendly_id(value)
    value.to_s
  end
end
