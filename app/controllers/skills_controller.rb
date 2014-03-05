class SkillsController < ApplicationController

def index
	if params[:tag]
		@skills = Skill.tagged_with(params[:tag])
	else
		@skills = Skill.all
	end
	@skills_locations = Array.new(@skills.count) { Array.new(2) }
	i = 0
	@display_position = Hash.new
	@skills.each do |skill|
		@skills_locations[i] = [skill.location.latitude, skill.location.longitude]
		@display_position[skill.id] = i + 1
		i += 1
	end
	@user_skills = false
end

def show
	@skill = Skill.find(params[:id])
	@location = @skill.skills_locationstion
	@bound = [@location.latitude, @location.longitude]
	@bounds = [[48.86473789999999 , 2.3898164],@bound]
	# binding.pry
end
private
  def skill_params
    params.require(:skill).permit(:title, :description, :tag_list)
  end

end
