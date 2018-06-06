class CoursestafftracksController < InheritedResources::Base
  before_action :authenticate_admin_user!

  def new  
      @coursestafftrack = Coursestafftrack.new  
      # @courses = Course.find(params[:id])  
      # @courseid = @courses.id
      @staffid = current_admin_user.id
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

