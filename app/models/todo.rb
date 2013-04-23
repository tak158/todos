class Todo < ActiveRecord::Base
  validates_presence_of:task
  belongs_to :user
end
