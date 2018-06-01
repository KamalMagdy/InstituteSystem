class CoursestafftracksController < InheritedResources::Base
  def new  
    @coursestafftrack = Coursestafftrack.new    
    @courseid = 1
    #current_user.id
    @staffid = 1
    @trackid = 1
    #User.where(name: 'Joe', email: 'joe@example.com')
    #l model bta3 l scaffold bta3 l ternary ben l course w l track w l staff w where an l 
    #course name yb2a zy l name bta3 l  course hna w l group bta3 l student yb2a s7 
 end     

  private

    def coursestafftrack_params
      params.require(:coursestafftrack).permit(:material, :course_id, :track_id, :staff_id)
    end
end

