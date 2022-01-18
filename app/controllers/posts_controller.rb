class PostsController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:index]
    def index
    @posts = Post.all
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        @post.user = current_user
        if (@post.save)
            redirect_to root_url
        else
            flash[:alert] = "oops! looks like you've made a mistake"
            render :new
        end
    end

    private
    def require_login
        unless user_signed_in?
            flash[:notice] = "You must be logged in to access this section"
            redirect_to root_url # halts request cycle
        end
    end

    def post_params
        params.require(:post).permit(:title, :body,)
    end  

end
