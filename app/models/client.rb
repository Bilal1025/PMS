class Client < ApplicationRecord
  validates :name, presence: :true, uniqueness: { case_sensitive: false }, format: { with: /^[a-zA-Z0-9 _\.]*$/, multiline: true }
end
