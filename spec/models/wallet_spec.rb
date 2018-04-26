require 'rails_helper'

RSpec.describe Wallet, type: :model do

  context 'Checking Content Validity' do

    let(:user1) do
      User.create(name:'Raj', date_of_birth:'2018-02-06 16:21:16', gender:'male',email:Faker::Internet.email, password:'raj@josh.com')
    end

    let(:user2) do
      User.create(name:'Raj', date_of_birth:'2018-02-06 16:21:16', gender:'male',email:Faker::Internet.email, password:'raj@josh.com')
    end

    let(:wallet1) do
      Wallet.create(points: 100, user: user1)
    end
   
    let(:wallet2) do
      Wallet.create(points: 100, user_id: user2.id)
    end

    it 'is valid content' do
      expect(wallet1).to be_valid
    end

    it 'is invalid content' do
      expect(wallet2).to_not be_valid
    end  

  end

  context 'Checking User validity' do

    let(:user2) do
      User.create(name:'Raj', date_of_birth:'2018-02-06 16:21:16', gender:'male',email:Faker::Internet.email, password:'raj@josh.com')
    end

    let(:wallet3) do
      Wallet.create(points: 100, user_id: user2.id)
    end

    it 'is invalid' do
      expect(wallet3).to_not be_valid
    end

    it 'is invalid when user does not exist' do
      expect(wallet3).to_not be_valid
    end

  end

end