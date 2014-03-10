class Skill < ActiveRecord::Base
  belongs_to :user
  acts_as_taggable

  include PublicActivity::Model
  tracked

  def location
  	self.user.location
  end
end
