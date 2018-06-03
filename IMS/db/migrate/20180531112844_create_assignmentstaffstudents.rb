class CreateAssignmentstaffstudents < ActiveRecord::Migration[5.2]
  def change
    create_table :assignmentstaffstudents do |t|
      t.integer :assignment_id, :null => true
      t.integer :staff_id, :null => true
      t.integer :student_id, :null => true
      t.text :codeReview
      t.text :derlivered_assignment
      t.text :file
      t.timestamps
    end
  end
end
