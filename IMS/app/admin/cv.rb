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
    column :student_id
    column :path do |cv|
    link_to 'Download', cv.path_url
    end
    # column :path do |cv|
      # link_to cv.path.url, path_url  
    # end
    # column() { |cv| link_to 'Download', download, method: :get }
    actions
  end  



  filter :student_id


end
