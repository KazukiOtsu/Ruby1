class PostsController < ApplicationController
  def index
    @posts = Post.all
    @all_posts = Post.count
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :start_at, :end_at, :all_day, :memo))
    if @post.save
      flash[:notice] = "スケジュールを新規登録しました。"
      redirect_to :posts
    else
      flash[:notice] = "スケジュールの新規登録に失敗しました。"
      render action: :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit(:title, :start_at, :end_at, :all_day, :memo))
      flash[:notice] = "スケジュールIDが「#{@post.id}」の情報を更新しました。"
      redirect_to :posts
    else
      flash[:notice] = "スケジュール情報の更新に失敗しました。"
      render action: :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "IDが「#{@post.id}」のスケジュールを削除しました。"
    end
    redirect_to :posts
  end
end
