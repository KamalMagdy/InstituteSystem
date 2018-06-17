class AssignmentsController < InheritedResources::Base
  before_action :authenticate_admin_user!
  skip_before_action :verify_authenticity_token

  def beforenewpost
    session[:track]= params[:track_id]
    redirect_to :action => :new
  end

  def index 
    @arrayofcoursenames=[]
    @assignames=[]
    @assigdeadlines=[]
    @assigids=[]
    @assignmentobject=[]
    @assignmentlink=[]
    @arrayofcourses = Staffcourse.where(admin_user_id: current_admin_user.id)
    for @arrayofcourse in @arrayofcourses
      @assignments = Assignment.where(course_id: @arrayofcourse.course_id)
      for @assignmentt in @assignments
        @assignames.push(@assignmentt.name)
        @assignmentobject.push(@assignmentt)
        @assignmentlink.push(@assignmentt.assignmentfile_url)
        @assigdeadlines.push(@assignmentt.deadline)
        @assigids.push(@assignmentt.id)
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
      @tofindifitbelongstoadminuser = Staffcourse.where(course_id: @course.course_id)
      if @tofindifitbelongstoadminuser[0]["admin_user_id"] == current_admin_user.id
        @arrayofcourseids.push(@course.course_id)
        @name = Course.find(@course.course_id)
        @arrayofcoursenames.push(@name.name)
      end
    end
  end
  def edit
    @assignment = Assignment.find(params[:id])
    @arrayofcourseids=[]
    @arrayofcoursenames=[]
    @courses = CoursesTrack.where(track_id: session[:track])
    for @course in @courses
      @tofindifitbelongstoadminuser = Staffcourse.where(course_id: @course.course_id)
      if @tofindifitbelongstoadminuser[0]["admin_user_id"] == current_admin_user.id
        @arrayofcourseids.push(@course.course_id)
        @name = Course.find(@course.course_id)
        @arrayofcoursenames.push(@name.name)
      end
    end 
  end

  def beforenew
    @arrayofcourses = Staffcourse.where(admin_user_id: current_admin_user.id)
    @arrayoftracks=[]
    @arrayoftracksnames=[]
    for @arrayofcourse in @arrayofcourses
      @track = CoursesTrack.where(course_id: @arrayofcourse.course_id)
      @length = @arrayoftracks.length
      @arrayoftracks.push(@track[0]["track_id"]) unless @arrayoftracks.include?(@track[0]["track_id"])
        if @arrayoftracks.length == @length
        else
          @trackname = Track.find(@track[0]["track_id"])
          @arrayoftracksnames.push(@trackname.name) unless @arrayoftracksnames.include?(@trackname.name)
        end
    end
  end
  
  private

    def assignment_params 
      params.require(:assignment).permit(:name, :deadline, :course_id, :assignmentfile, :admin_user_id)
    end
end

