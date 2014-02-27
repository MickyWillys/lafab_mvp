class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])	
	end

	def update
		user = current_user
		
		unless params[:user][:picture].nil?
			ext = "." + params[:user][:picture].original_filename.split(".")[1]
			image_path = params[:user][:picture].path
			user.upload_images(image_path, ext)
		end

		if user.update_attributes(user_params)
			flash[:success] = "Profile updated"
			redirect_to user
		end
	end

	def edit
		@user = current_user
	end


	private

	def current_user
		@account = current_account
		@user = User.find(@account.user_id)	
	end 

	def user_params
		params.require(:user).permit(:name, :picture_name)
	end

	
end