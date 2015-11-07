class Task < ActiveRecord::Base
  has_many :submissions
end
