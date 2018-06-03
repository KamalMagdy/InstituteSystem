class CoursesController < InheritedResources::Base

  before_action :get_course, only: [:show]
  def show
    @materials_material=[];
    @materials_material_name=[];
    @materials_material_type=[];
    @materials_material_id=[];
    @assignments_delivered=[];
    @assignments_file=[];
    @assignments_createdat=[];
    @assignments_staff=[];
    @assignments_id=[];
    @courseassignments_deadline=[];
    @courseassignments_description=[];
    @courseassignments_assignmentfile=[];
    @courseassignments_staff=[];
    @courseassignments_id=[];
    materials = ActiveRecord::Base.connection.exec_query("select * from coursestafftracks where course_id=#{@course.id}")
    for material in materials
    @materials_material.push("#{material['material']}")
    @materials_material_id.push("#{material['id']}")
    @materials_material_name.push("#{material['material_name']}")
    @materials_material_type.push("#{material['material_type']}")
    end
    assignmentsuploaded = ActiveRecord::Base.connection.exec_query("select * from assignmentstaffstudents where course_id=#{@course.id} and student_id=1")
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

  private

    def course_params
      params.require(:course).permit(:name)
    end

    def get_course
      @course = Course.find(params[:id])
  end

end

