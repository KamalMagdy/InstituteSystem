ActiveAdmin.register Cv do
    permit_params :path, :student_id
    actions :index, :show , :company

  index do
    selectable_column
    id_column
    column :student_id
    column :student
    column :path
 
    actions
  end

  filter :student_id


end
