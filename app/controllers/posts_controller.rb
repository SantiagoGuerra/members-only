class PostsController < ApplicationController
    def new
        @post=Post.new
    end

    def create
      @post = Post.new(post_params)
      @post.user_id = current_user.id
      @post.save
    end

    def index
      @posts = Post.all
    end

end
