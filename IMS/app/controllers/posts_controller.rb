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
        # @post.tags << Post_Tag.find(params[:id]) 
        format.html { redirect_to(@post, :notice => 'Post was successfully created.') }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end



    # GET /posts/new
  # GET /posts/new.xml
  def new
    @tags = Tag.all
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  
    def show
    @post = Post.find(params[:id])
    @tags = @post.tags
    @tags.each do |tag|
      
        puts tag.body
     end
     
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end
  

  private
  def post_params
    params.require(:post).permit(:body,:student_id,:tags)
  end    
end

