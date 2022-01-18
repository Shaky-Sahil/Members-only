class PostsController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:index]
    def index
    @posts = Post.all
    end

    def new
    end

    def create
    end

    private
    def require_login
        unless user_signed_in?
            flash[:alert] = "You must be logged in to access this section"
            redirect_to root_url # halts request cycle
        end
    end

end
