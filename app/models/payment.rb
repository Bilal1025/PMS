class Payment < ApplicationRecord
  belongs_to :project

  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end
