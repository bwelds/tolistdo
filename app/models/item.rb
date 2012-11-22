class Item < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :title, :list_id, :priority, :due_date, :completed
  validates :title, :presence => true
  default_scope :order => 'priority'
  belongs_to :list
end
