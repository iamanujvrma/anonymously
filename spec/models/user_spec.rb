require 'rails_helper'

RSpec.describe User do

  context 'check validity of name' do

    let(:user1) { build(:user, name: '12pinky') }
    let(:user2) { build(:user, name: '_pinky') }
    let(:user3) { build(:user, name: 'p') }
    let(:user4) { build(:user, name: 'pinkyroutbv egbs brejgbjbjkg bnjmsbnsjgrtkhb grejhgb') }

    it 'validates name starting with a number' do
      expect(user1.valid?).to eq(false)
      expect(user1.errors['name']).to eq(["name cannot start with a number or underscore"])
    end

    it 'validates name starting with underscore'  do
      expect(user2.valid?).to eq(false)
      expect(user2.errors['name']).to eq(["name cannot start with a number or underscore"])
    end

    it 'validates name with length less than 2'  do
      expect(user3.valid?).to eq(false)
      expect(user3.errors['name']).to eq(["is too short (minimum is 2 characters)"])
    end

    it 'validates name with length more than 20' do
      expect(user4.valid?).to eq(false)
      expect(user4.errors['name']).to eq(["is too long (maximum is 20 characters)"])
    end

  end
  
	context 'check validity of date of birth' do
    
    let(:user1) { build(:user) }
    
    it 'vaildates date of birth is Time type' do
      expect(user1.valid?).to eq(true)
    end

    it 'is not valid without date of birth'
    it 'is valid with date of birth'
    it 'is not valid for future date'
  end

end

