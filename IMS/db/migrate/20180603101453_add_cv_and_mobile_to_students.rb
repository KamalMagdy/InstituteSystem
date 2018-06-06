class AddCvAndMobileToStudents < ActiveRecord::Migration[5.2]
  def change
  	add_column :students, :cv, :string
  	add_column :students, :mobile, :string
  end
end

