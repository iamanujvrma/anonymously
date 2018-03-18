require 'rails_helper'

RSpec.describe Message, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  #context 'Checking Content Validity' do
 context 'Checking Content Validity' do
    let(:user1) do
      user1 = User.create(name:'MyString', date_of_birth:'2018-02-06 16:21:16', gender:'male',email:Faker::Internet.email, password:'pinky@10')
    end

    let(:user2) do #{ build(:user, confirmed_at: Time.now) }
      user2 = User.create(name:'MyString', date_of_birth:'2018-02-06 16:21:16', gender:'male',email:Faker::Internet.email, password:'pinky@10')
    end

    let(:message1) do
      message1 = Message.create(sender_id: user1.id, receiver_id: user2.id, content:'Hello how are you!')
    end

    let(:message2) do
      message2 = Message.create(sender_id: user1.id, receiver_id: user2.id, content:'')
    end
    
    it 'is valid content' do
      expect(message1).to be_valid
    end

    it 'is invalid content' do
      expect(message2).to_not be_valid
    end  

  end



  context 'Checking User validity' do

    let(:user3) do

      user3 = User.create(name:'MyString', date_of_birth:'2018-02-06 16:21:16', gender:'male',email:Faker::Internet.email, password:'pinky@10')

    end

    let(:message3) do

      message3 = Message.create(sender_id: user3.id, receiver_id: user3.id, content:'sender receiver are same')

    end

    let(:message4) do

      message4 = Message.create(sender_id: user3.id, receiver_id: '100', content:'receiver does not exist')

    end



    it 'is invalid' do

      expect(message3).to_not be_valid

    end

    it 'is invalid when user does not exist' do

      expect(message4).to_not be_valid

    end



  end



  context 'Checking Message Associations' do

    it { should belong_to(:sender) }

    it { should belong_to(:receiver) }

  end


end


