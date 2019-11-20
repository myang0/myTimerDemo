class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.string :uname
      t.integer :duration
      t.boolean :success

      t.timestamps
    end
  end
end
