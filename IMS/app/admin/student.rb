ActiveAdmin.register Student do
    permit_params :email, :password, :password_confirmation, :name, :birth, :gender, :group

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :birth
    column :gender
    column :created_at
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
      f.input :gender
      f.input :birth
      f.input :avatar
    end
    f.actions
  end

end
