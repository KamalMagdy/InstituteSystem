class CoursestudenttracksController < InheritedResources::Base
  # before_action :authenticate_admin_user!, only: [:index, :new]
  before_action :authenticate_student!, only: [:show]
  def new  
    @coursestudenttrack = Coursestudenttrack.new    
  end 
  def show
    session[:student]=current_student
    @coursename=[]; 
    @coursestudenttracks = ActiveRecord::Base.connection.exec_query("select * from coursestudenttracks where student_id=#{session[:student].id}")
    for coursestudenttrack in @coursestudenttracks
      result = ActiveRecord::Base.connection.exec_query("select * from courses where id=#{coursestudenttrack['course_id']}")
      @coursename.push(result[0]['name'])
    end
  end
  def index
    @courses = ActiveRecord::Base.connection.exec_query("select * from courses_tracks where track_id=1")
    @students = ActiveRecord::Base.connection.exec_query("select * from lists where track_id=1")
    
  end 
  

  private

    def coursestudenttrack_params
      params.require(:coursestudenttrack).permit(:grade, :course_id, :track_id, :student_id)
    end
end

