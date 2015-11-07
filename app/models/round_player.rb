class RoundPlayer < ActiveRecord::Base
  belongs_to :round
  belongs_to :user
end
