class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.references :user, index: true
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
