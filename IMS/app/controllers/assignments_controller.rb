class AssignmentsController < InheritedResources::Base
  before_action :authenticate_admin_user!

  private

    def assignment_params
      params.require(:assignment).permit(:description, :deadline, :course_id, :assignmentfile, :staff_id)
    end
end

