class CoursesController < InheritedResources::Base
  before_action :authenticate_admin_user!, only: [:new, :edit, :destroy, :allcourses] 
  before_action :authenticate_student!, only: [:show]
  before_action :get_course, only: [:show]
  def index
    @coursenames=[]
    @courseids=[]
    @track = ActiveRecord::Base.connection.exec_query("select track_id from lists where student_id=#{current_student.id}")
    @courses = CoursesTrack.where(track_id: @track[0]["track_id"])
    for @course in @courses
      @name = Course.where(id: @course.course_id)
      @coursenames.push("#{@name[0]['name']}")
      @courseids.push("#{@name[0]['id']}")
    end
  end

  def allcourses
    @coursenames=[]
    @instructornames=[]
    @track = ActiveRecord::Base.connection.exec_query("select track_id from lists where student_id=#{current_student.id}")
    @courses = CoursesTrack.where(track_id: @track[0]["track_id"])
    for @course in @courses
      @name = Course.where(id: @course.course_id)
      @coursenames.push("#{@name[0]['name']}")
      @instructorname = Staffcourse.where(course_id: @course.course_id)
      @instructornames.push("#{@instructorname[0]['admin_user_id']}")
    end
  end

  def show
    session[:student]=current_student
    @materials_material=[]
    @materials_material_name=[]
    @materials_material_type=[]
    @materials_material_id=[]
    @assignments_delivered=[]
    @assignments_file=[]
    @assignments_createdat=[]
    @assignments_staff=[]
    @assignments_id=[]
    @assignments_review=[]
    @courseassignments_deadline=[]
    @courseassignments_description=[]
    @courseassignments_assignmentfile=[]
    @courseassignments_staff=[]
    @courseassignments_name=[]
    @courseassignments_id=[]
    materials = ActiveRecord::Base.connection.exec_query("select * from coursestafftracks where course_id=#{@course.id}")
    for material in materials
    @materials_material.push("#{material['material']}")
    @materials_material_id.push("#{material['id']}")
    @materials_material_name.push("#{material['material_name']}")
    @materials_material_type.push("#{material['material_type']}")
    end
    assignmentsuploaded = ActiveRecord::Base.connection.exec_query("select * from assignmentstaffstudents where course_id=#{@course.id} and student_id=#{session[:student].id}")
    for assignmentuploaded in assignmentsuploaded
    @assignments_delivered.push("#{assignmentuploaded['derlivered_assignment']}")
    @assignments_file.push("#{assignmentuploaded['file']}")
    @assignments_createdat.push("#{assignmentuploaded['created_at']}")
    @assignments_staff.push("#{assignmentuploaded['staff']}")
    @assignments_id.push("#{assignmentuploaded['id']}")
    @assignments_review.push("#{assignmentuploaded['codeReview']}")
    end
    courseassignments = ActiveRecord::Base.connection.exec_query("select * from assignments where course_id=#{@course.id}")
    for courseassignment in courseassignments
    @courseassignments_deadline.push("#{courseassignment['deadline']}")
    @courseassignments_description.push("#{courseassignment['description']}")
    @courseassignments_assignmentfile.push("#{courseassignment['assignmentfile']}")
    @courseassignments_staff.push("#{courseassignment['staff']}")
    @courseassignments_id.push("#{courseassignment['id']}")
    @courseassignments_name.push("#{courseassignment['name']}")
    end
  end
  def create

    course = Course.new
    course.name = params[:course][:name] 
    existcourse = Course.where(name: course.name)
      if existcourse.empty?
        course.save!
        @trackid =  Staff.where(admin_user_id: current_admin_user.id)
        @instid = params[:admin_user_id]
        @list = ActiveRecord::Base.connection.exec_query("insert into courses_tracks (course_id, track_id, created_at, updated_at) values ('#{course.id}', #{@trackid[0]["track_id"]}, '#{course.created_at}', '#{course.updated_at}')")
        @coursestaff = ActiveRecord::Base.connection.exec_query("insert into staffcourses (course_id, admin_user_id, created_at, updated_at) values ('#{course.id}', #{@instid}, '#{course.created_at}', '#{course.updated_at}')")
        redirect_to posts_path
      else
        flash[:notice] = "The course name must be unique"
        redirect_to posts_path
      end
  end
  def new
    @course = Course.new
    @arrayofinstructornames=[]
    @arrayofinstructorids=[]
    @arrayofinstructors = ActiveRecord::Base.connection.exec_query("select * from admin_users where role='Instructor' ")
    for @arrayodinstructor in @arrayofinstructors
      @arrayofinstructornames.push(@arrayodinstructor['name'])
      @arrayofinstructorids.push(@arrayodinstructor['id'])
    end
  end

  private
    def course_params
      params.require(:course).permit(:name, track_attributes:[:track_id])
    end
    def get_course
      @course = Course.find(params[:id])
    end
  end

