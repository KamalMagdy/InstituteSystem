class PostsController < InheritedResources::Base
  
  def upvote 
    @post = Post.find(params[:id])
    @post.upvote_by current_student
    #redirect_to :back
    redirect_to(@post)
  end  
  def index
   
    if params[:tag]
      @posts = Post.tagged_with(params[:tag])
    else
      @posts = Post.all
    end
  end

  def downvote
    @post = Post.find(params[:id])
    @post.downvote_by current_student
    #redirect_to :back
    redirect_to(@post)
  end

  def create 
    # puts " i am here \n"
    # puts params

    @post=Post.create(post_params)
    respond_to do |format|
      if @post.save
        puts "ffffffffffffffffffff"
        puts @post.student_id
        puts @post.tag_list
        # @post.tags << Post_Tag.find(params[:id]) 
        @post.tag_list.add(@post.tag_list, parse: true)
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
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  
    def show
    @post = Post.find(params[:id]) 
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end
  

  protected
  def post_params
    params.require(:post).permit(:body, :student_id,:tag_list)
  end    
end

