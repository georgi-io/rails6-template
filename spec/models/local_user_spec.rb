require 'rails_helper'
require 'securerandom'

RSpec.describe LocalUser, type: :model do
  subject {
    described_class.new(name: 'Sebastian Georgi',
                        email: 'sebastian@georgi.io',
                        auth0_id: SecureRandom.uuid)
  }

  context 'Validations' do
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
  end
end
