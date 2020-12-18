class LocalUser < ApplicationRecord
  validates :auth0_id, presence: true
  validates :name, presence: true
  validates :email, presence: true
end
