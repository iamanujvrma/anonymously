require 'rails_helper'

RSpec.describe User do

  context 'check validity of name' do

    let(:user1) { build(:user, name: '12pinky') }
    let(:user2) { build(:user, name: '_pinky') }
    #let(:user3) { build(:user, name: 'p') }
    #let(:user4) { build(:user, name: 'pinkyroutbv egbs brejgbjbjkg bnjmsbnsjgrtkhb grejhgb') }
    let(:user5) {build(:user, name: 'pinky rout')}

    it 'validates name with only alphabets'  do
    	#expect(user5.errors).to eq([])
    	expect(user5.valid?).to eq(true)
    end

    it 'validates name starting with a number' do
      expect(user1.valid?).to eq(false)
      #expect(user1.errors).to eq([])
      expect(user1.errors['name']).to eq(["name cannot start with a number or underscore"])
    end

    it 'validates name starting with underscore'  do
      expect(user2.valid?).to eq(false)
      expect(user2.errors['name']).to eq(["name cannot start with a number or underscore"])
    end
    
    it do
     should validate_presence_of(:name).
     with_message("can't be blank")
    end

    it { should validate_length_of(:name).is_at_least(2) }

    #it 'validates name with length less than 2'  do
    #  expect(user3.valid?).to eq(false)
    #  expect(user3.errors['name']).to eq(["is too short (minimum is 2 characters)"])
    #end
    it { should validate_length_of(:name).is_at_most(20) }
    #it 'validates name with length more than 20' do
    #  expect(user4.valid?).to eq(false)
    #  expect(user4.errors['name']).to eq(["is too long (maximum is 20 characters)"])
    #end

  end

  context 'check validity of date of birth' do

    let(:user1) { build(:user) }
    let(:user2) { build(:user, date_of_birth: 'xyz') }
    let(:user3) { build(:user, date_of_birth: nil) }
    let(:user4) { build(:user, date_of_birth: "2019-01-01") }

    it 'vaildates date of birth is Time type' do
      expect(user1.valid?).to eq(true)
      expect(user1.errors[:date_of_birth]).to eq([])
    end

    it 'vaildates date of birth is not Time type' do
      expect(user2.valid?).to eq(false)
      expect(user2.errors[:date_of_birth]).to eq(["can't be blank", 'Is an invalid date.'])
    end

    it 'is not valid without date of birth' do
      expect(user3.valid?).to eq(false)
      expect(user3.errors[:date_of_birth]).to eq(["can't be blank", 'Is an invalid date.'])
    end

    it 'is valid with date of birth' do
      expect(user1.valid?).to eq(true)
      expect(user1.errors[:date_of_birth]).to eq([])
    end

    it 'is not valid for future date' do
      expect(user4.valid?).to eq(false)
      expect(user4.errors[:date_of_birth]).to eq(['Date of Birth cannot be in future.'])
    end
  end

  context 'check validity of gender' do

    it { should validate_inclusion_of(:gender).in_array(['male','Female','Male','female']) }

  end

end

