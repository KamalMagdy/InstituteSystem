class CoursestudenttracksController < InheritedResources::Base
  def new  
    @coursestudenttrack = Coursestudenttrack.new    

  end 

  private

    def coursestudenttrack_params
      params.require(:coursestudenttrack).permit(:grade, :course_id, :track_id, :student_id)
    end
end

