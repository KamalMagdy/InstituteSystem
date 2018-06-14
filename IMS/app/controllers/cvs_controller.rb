class CvsController < InheritedResources::Base
  before_action :authenticate_admin_user| authenticate_student!, only: [:index]
  before_action :authenticate_student!, only: [:new, :edit]

  def company
    cvs = []
    @cvs = Cv.all
   
  end

  def show
    @cvarray=[]
    @cv_comments= ActiveRecord::Base.connection.exec_query("select * from cvs where student_id=#{current_student.id}")
    @cvs_comments = ActiveRecord::Base.connection.exec_query("select * from active_admin_comments where resource_id =#{ @cv_comments[0]['id']}")
    for @cv_comment in @cvs_comments
     # @author_name = ActiveRecord::Base.connection.exec_query("select name from admin_users where id =1")
 
    @cvarray.push( @cv_comment["body"])
    end
    @cv = Cv.find(params[:id])
  end
  
  def index
    @students_arr = []
    @students = ActiveRecord::Base.connection.exec_query("select * from cvs")
    for @student in @students
    @students_arr.push( @student["student_id"])
    end
    @cvs = Cv.all
  end

  private

    def cv_params
      params.require(:cv).permit(:path, :student_id)
    end
end

