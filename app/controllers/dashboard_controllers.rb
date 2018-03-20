# frozen_string_literal: true

class DashboardController < ApplicationController
  def index
    @messages = current_user.received_messages
  end
end
