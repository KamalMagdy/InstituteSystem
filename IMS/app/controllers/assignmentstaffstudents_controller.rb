class AssignmentstaffstudentsController < InheritedResources::Base
  # before_action :authenticate_admin_user!, only: [:index]
  before_action :authenticate_student!, only: [:new]
  skip_before_action :verify_authenticity_token

  def index
    @assignmentstaffstudents = Assignmentstaffstudent.all
    @trackarray=[]
    for @assignmentstaffstudent in @assignmentstaffstudents
      @coursestracks = CoursesTrack.where(course_id: @assignmentstaffstudent["course_id"])
      @trackname = Track.where(id: @coursestracks[0]["track_id"])
      @trackarray.push(@trackname[0]["name"])
    end
  end
  def new  
    session[:student]=current_student
    @assignments = Assignment.find(params[:id])
    @assignmentstaffstudent = Assignmentstaffstudent.new  
    @studentid = session[:student].id  
    @staffid = @assignments.admin_user_id
    @assignmentid = @assignments.id
    @groupid = session[:student].group_id
    @courseid= @assignments.course_id
  end 
  def show 
    @assignmentstaffstudent = Assignmentstaffstudent.find(params[:id])
    # @assignmentstaffstudent = ActiveRecord::Base.connection.exec_query("select * from assignmentstaffstudents where id=#{params[:id]}")
  end 
  def submitcodereview
    puts "ana get fn l submit"
    puts params[:codeReview]
    puts params[:id]
    @assignments = Assignmentstaffstudent.find(params[:id])
    @assignments.codeReview = params[:codeReview]
    @assignments.save!
    redirect_to :action => :index
  end
  private
    def assignmentstaffstudent_params   
    params.require(:assignmentstaffstudent).permit(:derlivered_assignment, :assignment_id, :student_id, :admin_user_id, :file, :course_id, :codeReview)
    end
end

