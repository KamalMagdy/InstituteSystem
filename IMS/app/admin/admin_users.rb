ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation, :role, :rolesupervisorcancreate, :social_no , :name,  track_ids: []

  controller do 
    def create
      super
    end
  end


    after_create do |user|
      if (params[:admin_user][:role]=='Supervisor')
      @trackid=  params[:admin_user][:track_ids]
      @staff = ActiveRecord::Base.connection.exec_query("insert into staffs (admin_user_id, track_id, created_at, updated_at) values ('#{@admin_user.id}', #{@trackid}, '#{@admin_user.created_at}', '#{@admin_user.updated_at}')")
      else
        if (params[:admin_user][:role]=='Instructor')
          puts "L mfrod yb2a 3ndy aktr mn track"
        end
      end
    end

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    column :name
    column :role
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at


  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :role, :as => :select 
      f.input :social_no
      f.input :tracks, :as => :radio, collection => Track.all
    end
    f.actions
  end

end
