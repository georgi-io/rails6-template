require 'rails_helper'
require 'securerandom'

RSpec.describe LocalUser, type: :model do
  subject {
    described_class.new(name: 'Sebastian Georgi',
                        email: 'sebastian@georgi.io',
                        auth0_id: SecureRandom.uuid)
  }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to be_invalid
    end

    it 'is not valid without an email' do
      subject.email = nil
      expect(subject).to be_invalid
    end

    it 'is not valid without an auth0_id' do
      subject.auth0_id = nil
      expect(subject).to be_invalid
    end

    it 'validated uniqueness of auth0_id' do
      subject.save!
      u = LocalUser.new(name: 'Sebastian Georgi',
                        email: 'sebastian@georgi.io',
                        auth0_id: subject.auth0_id)
      expect(u).to be_invalid
    end
  end

  describe '#upsert_from_auth' do
    it 'retrieves and updates an existing record' do
      subject.save!
      updated = described_class.upsert_from_auth(subject.auth0_id, 'New Name', 'new@email.com')
      expect(updated.id).to eq subject.id
      expect(updated.name).to eq 'New Name'
      expect(updated.email).to eq 'new@email.com'
    end

    it 'creates a new record for given auth0_id' do
      auth0_id = SecureRandom.uuid
      expect(described_class.upsert_from_auth(auth0_id, 'New Name', 'new@email.com').auth0_id).to eq auth0_id
    end
  end
end
