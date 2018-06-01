class PostsController < InheritedResources::Base

  private

    def post_params
      params.require(:post).permit(:body, :student_id, :staff_id)
    end
end

