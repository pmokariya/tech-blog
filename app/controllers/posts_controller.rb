class PostsController < ApplicationController
  before_action :authenticate_user! ,except: [:index,:show]
  before_action :set_post, only: [:show, :edit, :update, :destroy,:downvote,:upvote]

  # GET /posts
  # GET /posts.json
  def index
    if params[:key] == "my_blog"
      @posts = Post.all.where(user_id: current_user.id)
    elsif params[:key] == "all"
      @posts = Post.all
    else
      @posts = Post.all
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @comment = @post.comments.new
    @comments = @post.comments.all
  end

  # GET /posts/new
  def new
    @user = current_user
    @post = @user.posts.new
    # @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    # @post = Post.new(post_params)
    @user = current_user
    @post = @user.posts.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
   @post.upvote_by current_user
   redirect_to @post
  end

  def downvote
   @post.downvote_by current_user
   redirect_to @post
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :description,:user_id)
    end
end
