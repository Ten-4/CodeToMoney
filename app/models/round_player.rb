class RoundPlayer < ActiveRecord::Base
  belongs_to :round
  belongs_to :user
  belongs_to :submission

  validates :user_id, uniqueness: { scope: :round_id }
end
