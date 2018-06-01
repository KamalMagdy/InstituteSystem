class AddGroupToStudents < ActiveRecord::Migration[5.2]
  def change
  	add_column :students, :group_id, :integer
  end
end
