class Item < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :title, :list_id

  belongs_to :list
end
