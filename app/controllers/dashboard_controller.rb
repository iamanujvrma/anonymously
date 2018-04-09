# frozen_string_literal: true

class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
  	@messages = current_user.sent_messages.all
  	@messages.each do |msg|
  		print msg.content
  	end
  end

=begin
 
=end

	def create
		@sent_message.save
=begin respond_to do |format|
		#	format.json { User.create(user_params); render :json => User.last.to_json}
		#	format.html { @user = User.new(user_params)
				if @user.save
					redirect_to users_path
				else
					render 'new'
				end }
=end
			
	end
end
