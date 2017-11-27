class BlogsController < ApplicationController
  def index
  end

  def show
  	@blog = Blog.find(params[:id])
  end

  def index
  	@blogs = Blog.all
  end

  def new
  	@blog = Blog.new
  end

def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
end

  def edit
  	@blog = Blog.find(params[:id])
  end

  def update
  	blog =Blog.find(params[:id])
  	blog.update(blog_params)
  	redirect_to blog_path(blog)
  end

  def destroy
  	blog = Blog.find(params[:id])
  	blog.destroy
  	redirect_to blogs_path
  end

  private
  def blog_params
   params.require(:blog).permit(:title,:category,:body)
 end

end
