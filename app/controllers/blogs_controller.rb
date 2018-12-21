class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  def index
    @blogs = Blog.all
    #@user = User.find(user_id)
    @favorites = Favorite.all
  end
  
  def new
    if params[:back]
      @blog = Blog.new(blog_params)
    else
      @blog = Blog.new
    end
  end
  
  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    
    if @blog.save
      #BlogMailer.blog_mail(@blog).deliver
      redirect_to @blog, notice: "ブログを作成しました！"
    else
      render :new
    end
  end
  
  def confirm
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    render :new if @blog.invalid?
  end
  
  def show
    params[:id]
    #@blog = Blog.find(params[:id])
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end

  
  def edit
    #@blog = Blog.find(params[:id])
  end
  
  def update
    #@blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "ブログを編集しました！"
    else
      render 'edit'
    end
  end
  
  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"削除しました"
  end
  
  private
  
  def blog_params
    params.require(:blog).permit(:title, :content)
  end
  
  def set_blog
    @blog = Blog.find(params[:id])
    
  end
end
