class MessagesController < ApplicationController
  def new
	@sent_message = current_user.sent_messages.new()
  print 'hii'
  end

  def create
    print 'hi server'
    @sent_message = current_user.sent_messages.new(message_params)
    @sent_message.save!
    if @sent_message.save!
      redirect_to dashboard_index_path
    else
      redirect_to user_message_path(current_user)
    end
  end
  private
  	def message_params
   		 params.require(:message).permit(:receiver_id, :content)
 	end
end
