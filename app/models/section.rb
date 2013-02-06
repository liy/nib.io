class Section < ActiveRecord::Base
  belongs_to :book
  attr_accessible :content, :title
end
