class HomeController < ApplicationController
  def index
    @results = Contact.search(params[:search])
  end
end
