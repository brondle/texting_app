class InboundMessagesController < ApplicationController
  protect_from_forgery :except => ["create"]

  def create
    Message.create(body: "Sorry bro we busy", to: params[:From], from: '+16812458089')
  end

end
