require 'rails_helper'

RSpec.describe Message, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  context 'Checking Content Validity' do
=begin    
    #let(:message1) { build(:message) }
    #let(:message2) { build(:message) }
    #let(:message3) { build(:message, content: 'Hello, this is sample text.Hello, this is sample text.Hello, this is sample text.Hello, this is sample text.Hello, this is sample text.Hello, this is sample text.Hello, this is sample text.Hello, this is sample text.Hello, this is sample text.Hello, this is sample text.Hello, this is sample text.Hello, this is sample text.Hello, this is sample text.Hello, this is sample text.Hello, this is sample text.Hello, this is sample text.Hello, this is sample text.Hello, this is sample text.Hello, this is sample text.Hello, this is sample text.Hello, this is sample text.Hello, this is sample text.Hello, this is sample text.Hello, this is sample text.Hello, this is sample text.Hello, this is sample text.Hello, this is sample text.Hello, this is sample text.Hello, this is sample text.Hello, this is sample text.Hello, this is sample text.Hello, this is sample text.Hello, this is sample text.Hello, this is sample text.Hello, this is sample text.Hello, this is sample text.Hello, this is sample text.Hello, this is sample text.Hello, this is sample text.Hello, this is sample text.Hello, this is sample text.Hello, this is sample text.Hello, this is sample text.Hello, this is sample text.Hello, this is sample text.') }
    it 'Checks that message is not blank' do
      should validate_presence_of(:content).with_message("content can't be blank(nil)")
    end
    it 'Checks that message does not exceed 1200 characters' do
      should validate_length_of(:content).is_at_most(1200)
    end
=end
    let(:message2) { build(:message) }
    it 'Validates a valid message' do
      expect(message2).to be_valid
    end
  end 	
end
