class AssignmentstaffstudentsController < InheritedResources::Base
  def index
    @assignmentstaffstudents = Assignmentstaffstudent.all
  end
  def new  
    @assignmentstaffstudent = Assignmentstaffstudent.new    
    @studentid = 1
    #current_user.id
    @staffid = 1
    @assignmentid = 1
    @groupid = 1
    @courseid=1
    #User.where(name: 'Joe', email: 'joe@example.com')
    #l model bta3 l scaffold bta3 l ternary ben l course w l track w l staff w where an l 
    #course name yb2a zy l name bta3 l  course hna w l group bta3 l student yb2a s7 
  end 
  


  private

    def assignmentstaffstudent_params   
    params.require(:assignmentstaffstudent).permit(:derlivered_assignment, :assignment_id, :student_id, :staff_id, :file, :course_id)
    end
end

