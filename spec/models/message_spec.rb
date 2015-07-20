require 'rails_helper'

describe Message, :vcr => true do
  it "doesn't save the message if twilio gives me an error" do
    message = Message.new(:body => 'hi', :to => '11111111', :from => '5039463641')
    message.save.should be false
  end

  it 'adds an error if the to number is invalid' do
    message = Message.new(body: 'hi', to: '1111111', from: '15005550006')
    message.save
    message.errors.messages[:base].should eq ["The 'To' number 1111111 is not a valid phone number."]
  end
  it 'sends a message if both numbers are valid' do
    message = Message.new(body: 'hello', to: '3044210861', from: '15005550006')
    message.save.should be true
  end
end
