ActiveAdmin.register Track do
    permit_params :name, :intake, :typeoftrack
    menu :parent => "", :if => proc { current_admin_user.role == "Supervisor" }

filter :name
filter :intake
filter :typeoftrack

end

