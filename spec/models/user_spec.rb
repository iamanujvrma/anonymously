require 'rails_helper'

RSpec.describe User do
  let(:user) { build(:user, name: 'pinkyrout')}
  let(:user1) { build(:user, name: '12pinky')}

  context 'check validity of name' do

    it 'validates name with only alphabets' do
      expect(user.valid?).to eq(true)
    end

    it 'validates name starting with a number' do
      expect(user1.valid?).to eq(false)
      expect(user1.errors['name']).to eq(["name cannot start with a number or underscore"])
    end

  end

end
