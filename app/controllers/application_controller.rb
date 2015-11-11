class ApplicationController < ActionController::Base
   before_filter :authenticate_user!

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound do
    flash[:warning] = 'Resource not found.'
    redirect_back_or root_path
  end

  def redirect_back_or(path)
    redirect_to request.referer || path
  end

  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  # helper_method :mailbox

  helper_method :mailbox, :conversation

    
  




    
    private

    def mailbox
      @mailbox ||= current_user.mailbox
    end

    def conversation
      @conversation ||= mailbox.conversations.find(params[:id])
    end

   
  



  
end
