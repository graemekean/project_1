class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_filter :get_mailbox
  # , :get_box, :get_actor

  def new
  end

  def index
    redirect_to conversations_path()

  end

  def create
    recipients = User.where(id: params['recipients'])
    conversation = current_user.send_message(recipients, params[:message][:body], params[:message][:subject]).conversation
    flash[:success] = "Message has been sent!"
    redirect_to conversation_path(conversation)
  end
end