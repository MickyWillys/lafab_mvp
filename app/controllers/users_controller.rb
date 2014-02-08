class UsersController < ApplicationController

	def show
	  	@user = current_user		
	end
	def update
		@user = current_user
    	if @user.update_attributes(user_params)
      		flash[:success] = "Profile updated"
      		redirect_to @user
    	end
    end
end

private
	def current_user
		@account = current_account
	  	@user = User.find(@account.user_id)	
	end 
	def user_params
	  params.require(:user).permit(:name)
	end