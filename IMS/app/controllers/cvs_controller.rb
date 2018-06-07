class CvsController < InheritedResources::Base

  def company
    cvs = []
    @cvs = Cv.all
   
  end

  private

    def cv_params
      params.require(:cv).permit(:path, :student_id)
    end
end

