class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :privacy, :terms, :data_deletion ]

  def home
    if user_signed_in?
      if current_user.posts.empty?
        @post = Post.new
      else
        redirect_to posts_path
      end
    end
  end

  def index
    if current_user.posts.any?
      @my_post = current_user.posts.last
      posts = Post.where(from_city: @my_post.from_city, to_city: @my_post.to_city).where.not(user_id: current_user.id)
      @matches = []
      posts.each do |match|
        # check if @my_post start_time is between match start_time and end_time
        if @my_post.start_time >= match.start_time && @my_post.start_time <= match.end_time && @my_post.spaces <= match.spaces
          @matches << match
        end
      end
    else
      redirect_to root_path
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to root_path
    else
      render :home
    end
  end

  def destroy
    @my_post = Post.find(params[:id])
    @my_post.destroy!
    redirect_to root_path, alert: "Your post has been deleted"
  end

  def privacy
  end

  def terms
  end

  def data_deletion
  end

  private

  def post_params
    params.require(:post).permit(:post_type, :start_time, :end_time, :spaces, :from_city, :to_city)
  end

end
