class CvsController < InheritedResources::Base
  before_action :authenticate_admin_user| authenticate_student!, only: [:index]
  before_action :authenticate_student!, only: [:new, :edit]

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

  def create
    if Cv.exists?(student_id: current_student.id)
      @cvdata = Cv.new(cv_params)
      @file_name = @cvdata.path.file.filename
      @cv = Cv.find(current_student.id)
     @update_cv = ActiveRecord::Base.connection.exec_query("UPDATE cvs SET path='#{@file_name}' WHERE student_id =#{current_student.id} ")
     format.html { redirect_to @cv, notice: 'Cv was successfully updated.' }
     format.json { render :show, status: :ok, location: @cv }
    else
      @cv = Cv.new(cv_params)
    respond_to do |format|
      if @cv.save
        format.html { redirect_to @cv, notice: 'Cv was successfully created.' }
        format.json { render :show, status: :created, location: @cv }
      else
        format.html { render :new }
        format.json { render json: @cv.errors, status: :unprocessable_entity }
      end
    end
  end
  end

  private

    def cv_params
      params.require(:cv).permit(:path, :student_id)
    end
end

