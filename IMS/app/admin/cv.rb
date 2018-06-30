ActiveAdmin.register Cv do
    permit_params :path, :student_id

    actions :index, :show , :company
  member_action :download, :method=>:get do

end

  controller do

    def showimport
      @cv = Cv.find(params[:id])
      
    end
end

  index do
    selectable_column
    id_column
    column :student
    column :path do |cv|
    link_to 'Download', cv.path_url
    end
    actions
  end  



  filter :student_id


end