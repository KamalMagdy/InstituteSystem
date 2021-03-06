class PostsController < InheritedResources::Base
  before_action :require_login

  def upvote 
    @post = Post.find(params[:id])
    @post.upvote_by current_student
    @posts = Post.all
    @events = Event.all
    redirect_to :controller => 'posts', :action => 'index'
  end 

  def downvote
    @post = Post.find(params[:id])
    @post.downvote_by current_student
    @posts = Post.all
    @events = Event.all
    redirect_to :controller => 'posts', :action => 'index'
  end

  def index 
    @post = Post.new
    if params[:tag]
      @posts = Post.tagged_with(params[:tag])
      @events = Event.all
    else
      @posts = Post.all
      @events = Event.all
    end

  end


  def create 
    @posts = Post.all
    @events = Event.all
    # @post=Post.create(post_params)
    @post = Post.new
    @post.student_id = params[:post][:student_id]
    @post.body = params[:body]
    @post.tag_list = params[:tag_list]
    @post.save!
    respond_to do |format|
      if @post.save
        @post.tag_list.add(@post.tag_list, parse: true)
        format.html { render :action => "index" }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end

    end
  end

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

  def update
    @posts = Post.all
    @events = Event.all
    @post=Post
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.html { render :action => "index" } 
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def require_login
    unless current_student || current_admin_user
      redirect_to '/students/sign_in'
    end
  end
  
  protected
  def post_params
    params.require(:post).permit(:body, :student_id,:tag_list)
  end    
end