class CreateCourseStaffTracksJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :course_staff_tracks do |t|
      t.integer :course_id
      t.integer :staff_id
      t.integer :track_id
      t.integer :group
      t.timestamps
    end
  end
end
