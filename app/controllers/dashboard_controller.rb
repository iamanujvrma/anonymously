# frozen_string_literal: true

class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @messages = current_user.received_messages.all
    @messages.each do |msg|
      print msg.content
    end
  end  
end
