class CreateCoursestudenttracks < ActiveRecord::Migration[5.2]
  def change
    create_table :coursestudenttracks, :primary_key => [:course_id, :student_id, :track_id] do |t|
      t.integer :course_id
      t.integer :student_id
      t.integer :track_id
      t.integer :grade
      t.timestamps
    end
  end
end
