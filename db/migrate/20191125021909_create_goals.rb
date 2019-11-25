class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.string :uname
      t.string :title
      t.string :category
      t.string :description

      t.timestamps
    end
  end
end
