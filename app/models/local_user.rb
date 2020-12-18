class LocalUser < ApplicationRecord
  validates :auth0_id, presence: true, uniqueness: true
  validates :name, presence: true
  validates :email, presence: true

  def self.upsert_from_auth(auth0_id, name, email)
    u = find_by(auth0_id: auth0_id) || new(auth0_id: auth0_id)
    u.update!(name: name, email: email, last_seen: DateTime.now)
    u
  end
end
