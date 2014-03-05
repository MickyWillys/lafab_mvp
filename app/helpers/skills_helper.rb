module SkillsHelper
	def tag_links(skill)
		raw skill.tag_list.map{ |tag| link_to tag, skills_path(tag: tag), 
			class: 'label radius secondary' }.join(' ')
	end
	

end