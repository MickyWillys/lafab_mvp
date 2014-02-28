class AddFieldsUsers < ActiveRecord::Migration
  def change
  	add_column :users, :prenom, :string
  	add_column :users, :nom, :string
  	add_column :users, :tranche_age, :string
  	add_column :users, :tel_fixe, :string
  	add_column :users, :tel_portable, :string
  	add_column :users, :role, :string
  end
end
