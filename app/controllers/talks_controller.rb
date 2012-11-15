class TalksController < ApplicationController
  def show
    render text: "This is #{params[:id]}'s talk!"
  end
end
