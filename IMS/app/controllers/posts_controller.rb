class PostsController < InheritedResources::Base
  
  def upvote 
    @post = Post.find(params[:id])
    @post.upvote_by current_student
    #redirect_to :back
    redirect_to(@post)
  end  

  def downvote
    @post = Post.find(params[:id])
    @post.downvote_by current_student
    #redirect_to :back
    redirect_to(@post)
  end

  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        puts @post.tags
        format.html { redirect_to(@post, :notice => 'Post was successfully created.') }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end


  def new
    @tags = Tag.all
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
end

  protected
  def post_params
    params.require(:post).permit(:body,:student_id,:tag_id)
  end

  
end

