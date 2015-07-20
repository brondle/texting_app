class MessagesController < ApplicationController
  def new
    @message = Message.new
  end
  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:notice] = "Your message has been sent."
      redirect_to '/'
    else
      flash[:alert] = "That message could not be sent."
      render :new
    end
  end
  private
  def message_params
    params.require(:message).permit(:to, :from, :body)
  end
end
