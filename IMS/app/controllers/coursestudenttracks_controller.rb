class CoursestudenttracksController < InheritedResources::Base
  before_action :authenticate_admin_user!, only: [:index, :new]
  before_action :authenticate_student!, only: [:show]
  skip_before_action :verify_authenticity_token

  def new  
    @coursestudenttrack = Coursestudenttrack.new  
    @coursenames=[]
    @courseids=[]
    @studentnames=[]
    @studentids=[]
    @trackid =  Staff.where(admin_user_id: current_admin_user.id)
    @courses = ActiveRecord::Base.connection.exec_query("select * from courses_tracks where track_id=#{@trackid[0]["track_id"]}")
    for @course in @courses
      @tempcourse = Course.find(@course['course_id'])
      @coursenames.push("#{@tempcourse.name}")
      @courseids.push("#{@tempcourse.id}")
    end  
    @students = ActiveRecord::Base.connection.exec_query("select student_id from lists where track_id=#{@trackid[0]["track_id"]}")
    for @student in @students
      @tempstudent = Student.find(@student["student_id"])
      @studentnames.push("#{@tempstudent.name}")
      @studentids.push("#{@student["student_id"]}")
    end
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
  def edit
    @trackid =  Staff.where(admin_user_id: current_admin_user.id)
    @student = Student.find(params[:id])
    @coursenames=[]
    @courses = ActiveRecord::Base.connection.exec_query("select * from courses_tracks where track_id=#{@trackid[0]["track_id"]}")
    for @course in @courses
      @tempcourse = Course.find(@course['course_id'])
      @coursenames.push("#{@tempcourse.name}")
    end
      @gradesarray=[]
      for @course in @courses  
        @grades = ActiveRecord::Base.connection.exec_query("select grade from coursestudenttracks where track_id=#{@trackid[0]["track_id"]} and student_id=#{@student.id} and course_id=#{@course['course_id']}")
        if (@grades.empty?)
          @gradesarray.push(0)
        else
          @gradesarray.push(@grades[0]["grade"])
        end
      end
  end
  def update
    @trackid =  Staff.where(admin_user_id: current_admin_user.id)
    @counter=0
    @courses = ActiveRecord::Base.connection.exec_query("select * from courses_tracks where track_id=#{@trackid[0]["track_id"]}")
    for @course in @courses
      @grades = ActiveRecord::Base.connection.exec_query("select * from coursestudenttracks where track_id=#{@trackid[0]["track_id"]} and student_id=#{params[:student]} and course_id=#{@course['course_id']}")
      if(params[:grade]["#{@counter}"]=="0")
      else
        @desiredrecord = Coursestudenttrack.find(@grades[0]["id"])
        @desiredrecord.grade = params[:grade]["#{@counter}"]
        @desiredrecord.save!
      end
      @counter = @counter +1
    end
    redirect_to :action => :index
  end
  def index
    @coursestudenttrackk = Coursestudenttrack.all
    @trackid =  Staff.where(admin_user_id: current_admin_user.id)
    @coursenames=[]
    @studentnames=[]
    @studentids=[]
    @gradesforeachstudent=[]
    @courses = ActiveRecord::Base.connection.exec_query("select * from courses_tracks where track_id=#{@trackid[0]["track_id"]}")
    for @course in @courses
      @tempcourse = Course.find(@course['course_id'])
      @coursenames.push("#{@tempcourse.name}")
    end
    @students = ActiveRecord::Base.connection.exec_query("select student_id from lists where track_id=#{@trackid[0]["track_id"]}")
    for @student in @students
      @tempstudent = Student.find(@student["student_id"])
      @studentnames.push("#{@tempstudent.name}")
      @studentids.push("#{@student["student_id"]}")
      @gradesarray=[]
      for @course in @courses  
        @grades = ActiveRecord::Base.connection.exec_query("select grade from coursestudenttracks where track_id=#{@trackid[0]["track_id"]} and student_id=#{@student['student_id']} and course_id=#{@course['course_id']}")
        if (@grades.empty?)
          @gradesarray.push(0)
        else
          @gradesarray.push(@grades[0]["grade"])
        end
      end
      @gradesforeachstudent.push(@gradesarray)
    end
  end
  def create 
    begin
      @track = ActiveRecord::Base.connection.exec_query("select track_id from lists where student_id=#{params[:coursestudenttrack][:student_id]}")
      coursestudenttrack = Coursestudenttrack.new
      coursestudenttrack.grade = params[:coursestudenttrack][:grade]
      coursestudenttrack.course_id = params[:coursestudenttrack][:course_id]
      coursestudenttrack.track_id = @track[0]["track_id"]
      coursestudenttrack.student_id = params[:coursestudenttrack][:student_id]
      existcourse = Coursestudenttrack.where(track_id: @track[0]["track_id"], student_id: coursestudenttrack.student_id, course_id: params[:coursestudenttrack][:course_id])
      if existcourse.empty?
        coursestudenttrack.save!
        redirect_to :action => :index
      else
        flash[:notice] = "You have entered a grade for this student before, you can edit it now"
        redirect_to :action => :index
      end
    end
  end
  

  private

    def coursestudenttrack_params
      params.require(:coursestudenttrack).permit(:grade, :course_id, :track_id, :student_id)
    end
end

