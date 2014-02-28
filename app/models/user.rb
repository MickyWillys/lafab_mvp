class User < ActiveRecord::Base
	has_one :account
	has_many :skills
	has_one :location
	
	def upload_images (picture_path, ext)
		
		
		self.picture_name =  "profile_pic" + "_" + self.id.to_s	
		
		
		cloudinary_options = {
			:public_id => picture_name,
			:crop => :limit, :width => 2000, :height => 2000,
			:eager => [
				{ :width => 200, :height => 200, 
					:crop => :thumb, :gravity => :face,
					:radius => 20, :effect => :sepia },
					{ :width => 100, :height => 150, 
						:crop => :fit, :format => 'png' }
						],                                     
					:tags => ['profile_picture']
		}
		
		if Cloudinary::Uploader.upload picture_path, cloudinary_options
			self.picture_name =  "profile_pic" + "_" + self.id.to_s + ext
			self.save
		else
			"soucis"
		end
	end

end
