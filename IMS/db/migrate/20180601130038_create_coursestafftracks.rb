class CreateCoursestafftracks < ActiveRecord::Migration[5.2]
  def change
    create_table :coursestafftracks do |t|
      t.integer :course_id
      t.integer :staff_id
      t.integer :track_id
      t.integer :group
      t.text :material
      t.timestamps
    end
  end
end