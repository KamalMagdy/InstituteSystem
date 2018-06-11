class AssignmentsController < InheritedResources::Base
  before_action :authenticate_admin_user!
  skip_before_action :verify_authenticity_token

  def beforenewpost
    session[:track]= params[:track_id]
    redirect_to :action => :new
  end
  def index 
    @arrayofcoursenames=[]
    @arrayofcourses = Staffcourse.where(admin_user_id: current_admin_user.id)
    for @arrayofcourse in @arrayofcourses
    @assignments = Assignment.where(course_id: @arrayofcourse.id)
    for @assignmentt in @assignments
      @name = Course.find(@assignmentt.course_id)
      @arrayofcoursenames.push(@name.name)
    end
    end
  end
  def new
    @assignment = Assignment.new
    @arrayofcourseids=[]
    @arrayofcoursenames=[]
    @courses = CoursesTrack.where(track_id: session[:track])
    for @course in @courses
      @arrayofcourseids.push(@course.id)
      @name = Course.find(@course.id)
      @arrayofcoursenames.push(@name.name)
    end
  end

  def beforenew
    @arrayofcourses = Staffcourse.where(admin_user_id: current_admin_user.id)
    @arrayoftracks=[]
    @arrayoftracksnames=[]
    for @arrayofcourse in @arrayofcourses
      @tracks = CoursesTrack.where(course_id: @arrayofcourse.id)
      for @track in @tracks
        @arrayoftracks.push(@track.track_id) unless @arrayoftracks.include?(@track.track_id)
        @trackname = Track.find(@track.track_id)
        @arrayoftracksnames.push(@trackname.name) unless @arrayoftracksnames.include?(@trackname.name)
      end
    end
  end
  
  private

    def assignment_params 
      params.require(:assignment).permit(:name, :deadline, :course_id, :assignmentfile, :staff_id)
    end
end

