ActiveAdmin.register Track do
    permit_params :name, :intake, :typeoftrack
    menu :parent => "Tracks", :if => proc { current_admin_user.role == "Manager" }

filter :name
filter :intake
filter :typeoftrack

end

