class Skill < ActiveRecord::Base
  belongs_to :user
  acts_as_taggable

  def location
  	self.user.location
  end
end
