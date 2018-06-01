class CreateAssignmentsStaffsStudentsJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :assignment_staff_student do |t|
      t.integer :assigntment_id
      t.integer :staff_id
      t.integer :student_id
      t.text :codeReview

      end
  end
end
