class SkillsController < ApplicationController
def show
	@skill = Skill.find(params[:id])
	@location = @skill.user.location
	@bound = [@location.latitude, @location.longitude]
	@bounds = [[48.86473789999999 , 2.3898164],@bound]
	# binding.pry
end
private
  def skill_params
    params.require(:skill).permit(:title, :description, :tag_list)
  end
end
