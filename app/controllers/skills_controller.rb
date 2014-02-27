class SkillsController < ApplicationController

private
  def skill_params
    params.require(:skill).permit(:title, :description, :tag_list)
  end
end
