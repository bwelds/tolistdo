class List < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name, :user_id

  belongs_to :user

end
