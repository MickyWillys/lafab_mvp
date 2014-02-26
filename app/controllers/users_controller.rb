class UsersController < ApplicationController

	def show
		@user = current_user	
	end

	def update
		user = current_user
		
		unless params[:user][:picture].nil?
			p = params[:user][:picture].original_filename
			ext = p[p.index('.').. p.length]
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