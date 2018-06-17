ActiveAdmin.register Cv do
    permit_params :path, :student_id
    actions :index, :show , :company
    
    

member_action :download, method: :get do
  cv = Cv.find(params[:id])
  send_file cv.upload_file
end

  index do
    selectable_column
    id_column
    column :student_id
    column :student
    column :download
 
    actions
  end

  filter :student_id


end
