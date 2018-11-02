class Project < ApplicationRecord
  has_many :payments, dependent: :destroy

  belongs_to :client

  validates :name, presence: :true, uniqueness: { case_sensitive: false }, format: { with: /^[a-zA-Z0-9 _\.]*$/, multiline: true }
end
