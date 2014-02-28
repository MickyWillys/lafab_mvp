class AddFieldsSkills < ActiveRecord::Migration
  def change
  	add_column :skills, :experience, :string
  	add_column :skills, :diplome, :string
  	add_column :skills, :dispo_debut, :datetime
  	add_column :skills, :dispo_fin, :datetime
  	add_column :skills, :statut_validation, :datetime


  end
end

