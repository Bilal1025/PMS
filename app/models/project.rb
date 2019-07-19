class Project < ApplicationRecord
  has_many :payments, dependent: :destroy
  has_many :time_logs, dependent: :destroy

  belongs_to :client
  belongs_to :manager, class_name: 'User', foreign_key: 'user_id', validate: true

  validates :name, presence: :true, uniqueness: { case_sensitive: false }, format: { with: /^[a-zA-Z0-9 _\.]*$/, multiline: true }
end
