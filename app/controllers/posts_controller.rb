class PostsController < ApplicationController
  def index
    @posts = Post.all
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      @posts = Post.order(created_at: :desc) 
      render turbo_stream: [
      turbo_stream.replace('post-list', partial: 'post', collection: @posts),
      turbo_stream.replace('post-form', partial: 'form', locals: { post: Post.new })
]
    else
      render turbo_stream: turbo_stream.replace('post-form', partial: 'form', locals: { post: @post })
    end
  end

  def edit
    @post= Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      @posts = Post.order(created_at: :desc)
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.replace('post-list', partial: 'post', collection: @posts),
            turbo_stream.replace('post-form', partial: 'form', locals: { post: Post.new })
            
          ]
        end
        format.html { redirect_to posts_path, notice: 'Post was successfully updated.' }
      end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace('post-form', partial: 'form', locals: { post: @post }) }
        format.html { render :edit }
      end
    end
  end
  

  def destroy
    @post= Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@post) }
    end
  end

    
  
  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
