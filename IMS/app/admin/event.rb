ActiveAdmin.register Event do
    permit_params :title, :body, :admin_user_id
end
