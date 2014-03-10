class MessagesController < ApplicationController
 
  # GET /message/new
  def new
    # raise params.inspect
    @rec = User.find(params[:user_id])
    @message = current_user.messages.new
  end
 
   # POST /message/create
  def create
    @recipient = User.find(params[:user])
    current_user.send_message(@recipient, params[:body], params[:subject])
    flash[:notice] = "Message has been sent!"
    redirect_to :conversations
  end

private
  def current_user
    @account = current_account
    @user = User.find(@account.user_id) 
  end 


end