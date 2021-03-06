class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  def articles
    @posts = Post.where(kind: "article")
    if (params[:tag] && params[:tag] != "")  && params[:title] != ""
      @articles = @posts.where(id: Tag.find_by(name: params[:tag]).post_ids, title: params[:title])
    elsif params[:title] && params[:title] != "" 
      @articles = @posts.where(title: params[:title])
    elsif params[:tag] && params[:tag] != "" 
      @articles = @posts.where(id: Tag.find_by(name: params[:tag]).post_ids)
    else
      @articles = @posts
    end
  end

  def forum
    @posts = Post.where(kind: "question")
    if (params[:tag] && params[:tag] != "")  && params[:title] != ""
      @forum = @posts.where(id: Tag.find_by(name: params[:tag]).post_ids, title: params[:title])
    elsif params[:title] && params[:title] != ""
      @forum = @posts.where(title: params[:title])
    elsif params[:tag] && params[:tag] != "" 
      @forum = @posts.where(id: Tag.find_by(name: params[:tag]).post_ids)
    else
      @forum = @posts
    end
  end
  # GET /posts/1
  # GET /posts/1.json
  def show
    @post_tag = PostTag.new
    @tags = Tag.where(post: true)
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  def new_article
    @article = Post.new
  end

  def new_question
    @question = Post.new
  end


  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        #send_notification(@post.user, @post)
        format.json { render :show, status: :created, location: @post }
      else
        format.html { redirect_to request.referrer }
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:user_id, :title, :content, :photo, :kind)
    end
 
    def send_notification(user, post)
      NotificationMailer.with(user: user, post:post).notification.deliver_now!
    end
end
