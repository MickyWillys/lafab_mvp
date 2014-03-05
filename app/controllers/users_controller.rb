class UsersController < ApplicationController
	def index
		@users = User.all
		@users_locations = Array.new(User.count) { Array.new(2) }
		@users.each do |user|
			@users_locations[user.id - 1] = [user.location.latitude, user.location.longitude]
		end
		
	end
	def show
		@user = User.find(params[:id])
		@skills = @user.skills
		@user_skills = true
	end

	def edit
		@user = current_user
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