class Task < ActiveRecord::Base
  belongs_to :user

  validates :prize, :numericality => { :greater_than_or_equal_to => 0 }
  validate :only_valid_numbers

  private
  def only_valid_numbers
      if (self.prize % 1000) != 0
          self.errors[:base] << "Number must be divisible by 1000!"
      end
  end
end
