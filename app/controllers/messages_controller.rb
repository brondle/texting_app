class MessagesController < ApplicationController
  def new
    @message = Message.new
  end
  def create
    messages = []
    recipients = message_params[:to].split(', ')
    recipients.each do |recipient|
      messages.push(Message.new(to: recipient, from: message_params[:from], body: message_params[:body]))
    end
    messages.each do |message|
      if  message.save
        flash[:notice] = "Your message has been sent."
      else
        flash[:alert] = "That message could not be sent."
      end
    end
    redirect_to '/'
  end
  private
  def message_params
    params.require(:message).permit(:to, :from, :body)
  end
end
