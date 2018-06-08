class CoursesController < InheritedResources::Base
  # before_action :authenticate_student!
  # before_action :authenticate_admin_user!, only: [:new, :edit, :destroy] 
  before_action :get_course, only: [:show]
  def index
    @coursenames=[]
    @courseids=[]
    @track = ActiveRecord::Base.connection.exec_query("select track_id from lists where student_id=#{current_student.id}")
    @courses = CoursesTrack.where(track_id: @track[0]["track_id"])
    for @course in @courses
      @name = Course.where(id: @course.id)
      @coursenames.push("#{@name[0]['name']}")
      @courseids.push("#{@name[0]['id']}")
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
    @courseassignments_deadline=[]
    @courseassignments_description=[]
    @courseassignments_assignmentfile=[]
    @courseassignments_staff=[]
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
    end
    courseassignments = ActiveRecord::Base.connection.exec_query("select * from assignments where course_id=#{@course.id}")
    for courseassignment in courseassignments
    @courseassignments_deadline.push("#{courseassignment['deadline']}")
    @courseassignments_description.push("#{courseassignment['description']}")
    @courseassignments_assignmentfile.push("#{courseassignment['assignmentfile']}")
    @courseassignments_staff.push("#{courseassignment['staff']}")
    @courseassignments_id.push("#{courseassignment['id']}")
    end
  end
  def create
    course = Course.new
    course.name = params[:course][:name] 
    course.save!
    @trackid=  params[:course][:track][:track_id]
    @list = ActiveRecord::Base.connection.exec_query("insert into courses_tracks (course_id, track_id, created_at, updated_at) values ('#{course.id}', #{@trackid}, '#{course.created_at}', '#{course.updated_at}')")
  end

  private
    def course_params
      params.require(:course).permit(:name, track_attributes:[:track_id])
    end
    def get_course
      @course = Course.find(params[:id])
    end
  end

