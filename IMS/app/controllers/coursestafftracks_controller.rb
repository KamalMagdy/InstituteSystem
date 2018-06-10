class CoursestafftracksController < InheritedResources::Base
  # before_action :authenticate_admin_user!
  skip_before_action :verify_authenticity_token
  def beforenewpost
    session[:track]= params[:track_id]
    redirect_to :action => :new
  end
  def new
    @coursestafftrack = Coursestafftrack.new  
    @staffid =1 #current_admin_user.id
    @arrayofcourseids=[]
    @arrayofcoursenames=[]
    @courses = CoursesTrack.where(track_id: session[:track])
    for @course in @courses
      @arrayofcourseids.push(@course.id)
      @name = Course.find(@course.id)
      @arrayofcoursenames.push(@name.name)
    end
    puts @arrayofcourseids
    puts @arrayofcoursenames

  end

  def index
  @coursestafftracks = Coursestafftrack.all
  @lecture_name=[];
  end   

  private
    def coursestafftrack_params
      params.require(:coursestafftrack).permit(:material, :course_id, :track_id, :staff_id, :material_name, :material_type)
    end
end

