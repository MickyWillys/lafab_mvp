class WelcomeController < ApplicationController
  def index
  	if account_signed_in? then
	  	@account = current_account
	  	# binding.pry
	  	@user = User.find(@account.user_id)
	end
  end
end
