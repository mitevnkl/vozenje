class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @post = Post.new
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

  private

  def post_params
    params.require(:post).permit(:post_type, :start_time, :end_time, :spaces, :from_city, :to_city)
  end

end
