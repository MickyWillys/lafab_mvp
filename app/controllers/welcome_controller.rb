class WelcomeController < ApplicationController
  def index
  	if signup
  		@account = current_account
  		@user = User.create(name: "")
  		@account.user_id = @user.id
  		@account.save
  	end


  	if account_signed_in? then
	  	@account = current_account
	  	# binding.pry
	  	@user = User.find(@account.user_id) unless signup
	end
  end

  

  def signup
  	if current_account != nil
  		@account = current_account 
  		@account.user_id == nil 
  	else
  		signup = false
  	end
  end
end
