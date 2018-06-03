class AssignmentsController < InheritedResources::Base

  private

    def assignment_params
      params.require(:assignment).permit(:description, :deadline, :course_id, :assignmentfile)
    end
end

