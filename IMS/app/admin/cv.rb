ActiveAdmin.register Cv do
    permit_params :path, :student_id
    actions :index, :show , :company
    
    action_item only: [:show] do
      link_to('Download File', download_admin_cv_path(resource)) if resource.upload_file.present?
    end
    

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
