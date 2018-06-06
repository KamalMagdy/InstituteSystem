class AssignmentstaffstudentsController < InheritedResources::Base
  before_action :authenticate_admin_user!, only: [:index]
  before_action :authenticate_student!, only: [:new]

  def index
    @assignmentstaffstudents = Assignmentstaffstudent.all
  end
  def new  
    session[:student]=current_student
    @assignments = Assignment.find(params[:id])
    @assignmentstaffstudent = Assignmentstaffstudent.new  
    @studentid = session[:student].id  
    @staffid = @assignments.staff_id
    @assignmentid = @assignments.id
    @groupid = session[:student].group_id
    @courseid= @assignments.course_id
  end  
  private
    def assignmentstaffstudent_params   
    params.require(:assignmentstaffstudent).permit(:derlivered_assignment, :assignment_id, :student_id, :staff_id, :file, :course_id)
    end
end

