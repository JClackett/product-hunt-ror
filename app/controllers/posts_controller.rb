class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  before_action :set_post, only: [:edit, :update, :destroy, :upvote]

  # GET /posts
  def index
    @posts = Post.all.reverse
  end


  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    @post.user = current_user
      if @post.save
        redirect_to posts_path
      else
        render :new
      end
  end


  # PATCH/PUT /posts/1
  def update
      if @post.update(post_params)
        redirect_to posts_path
      else
      render :edit
      end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
     redirect_to posts_path
  end

  def upvote
    @post = Post.find(params[:id])
    if current_user.voted_up_on? @post
      @post.downvote_by current_user
    else
    @post.upvote_by current_user
  end
    redirect_to :back
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
    params.require(:post).permit(:title, :description, :user_id, :url, category_ids: [])
  end
end
