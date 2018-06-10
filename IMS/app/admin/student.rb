ActiveAdmin.register Student do

    permit_params :email, :password, :password_confirmation, :name, :birth, :mobile, :gender, :avatar, :group_id,  track_ids: []


  controller do 
    def create
      super
    end
  end

    after_create do |user|
      
      @trackid=  params[:student][:track_ids]
      @list = ActiveRecord::Base.connection.exec_query("insert into lists (student_id, track_id, created_at, updated_at) values ('#{@student.id}', #{@trackid}, '#{@student.created_at}', '#{@student.updated_at}')")
    end
    # after_create do |user|
    #   UserNotifierMailer.welcome_email(@student).deliver_now
    # end

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :birth
    column :created_at
    # column :cv
    actions
  end

  filter :email
  filter :name
  filter :birth
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :gender, :as => :select 
      f.input :birth, :as => :datepicker
      f.input :avatar
      f.input :mobile
      f.input :tracks, :as => :radio, collection => Track.all
      f.input :group
      #f.input :lists
    end
    f.actions
  end

end
