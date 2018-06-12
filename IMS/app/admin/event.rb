ActiveAdmin.register Event do
    permit_params :title, :body, :admin_user_id
controller do
  def create
    @event.admin_user.id = current_admin_user.id
     super
  end
end

end
