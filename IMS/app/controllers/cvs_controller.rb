class CvsController < InheritedResources::Base

  def company
    cvs = []
    @cvs = Cv.all
   
  end

  def show
    @cvarray=[]
    @adminarray=[]
    @cv_comments= ActiveRecord::Base.connection.exec_query("select * from cvs where student_id=#{current_student.id}")
    @cvs_comments = ActiveRecord::Base.connection.exec_query("select * from active_admin_comments where resource_id =#{ @cv_comments[0]['id']} and resource_type='Cv'")
    for @cv_comment in @cvs_comments 

    @cvarray.push( @cv_comment["body"])
    puts @cv_comment['author_id']
    @adminarray.push(@cv_comment['author_id'])
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

