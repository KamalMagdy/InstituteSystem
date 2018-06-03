class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.text :description
      t.datetime :deadline
      t.text :assignmentfile
      t.integer :staff_id
      t.integer :course_id

      t.timestamps
    end
  end
end
