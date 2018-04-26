require 'rails_helper'

RSpec.describe WalletHistory, type: :model do

  context 'Checking Content Validity' do

    let(:user1) do
      User.create(name:'Raj', date_of_birth:'2018-02-06 16:21:16', gender:'male',email:Faker::Internet.email, password:'raj@josh.com')
    end
    let!(:wallet1) do
      wallet1 = Wallet.create(points: 10, user: user1)
    end

    let(:wallet_history1) do
      wallet_history1 = wallet1.wallet_histories.create(points: 10, recepient_name: 'Raj', transaction_type: 'Referral')
    end

    it 'is valid content' do
      expect(wallet_history1).to be_valid
    end

    it 'is invalid content' do
      wallet_history1.points = nil
      expect(wallet_history1).to_not be_valid
    end  

  end

  context 'Checking Wallet validity' do

    let(:wallet2) do
      wallet2 = Wallet.create(points: 10, user_id: 2)
    end

    let(:wallet_history2) do
      wallet_history2 = wallet2.wallet_histories
    end

  end

end