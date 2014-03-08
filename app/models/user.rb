class User < ActiveRecord::Base
	has_one :account
	has_many :skills
	has_one :location
	
	acts_as_messageable

	

	#Returning the email address of the model if an email should be sent for this object (Message or Notification).
	#If no mail has to be sent, return nil.
	def mailboxer_email(object)
	  #Check if an email should be sent for that object
	  #if true
	  return "define_email@on_your.model"
	  #if false
	  #return nil
	end

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
