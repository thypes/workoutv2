class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        #require "pry";binding.pry
        if @post.save
            #session[:user_id] = @user.id
            redirect_to @post, notice: "Post Saved"
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @post.update(post_params)
            redirect_to @post, notice: "Post updated!"
        else
            render :edit
        end
    end

    def destroy
        @post.destroy
        session[:post_id] = nil
        redirect_to root_url alert: "Post Deleted"
    end
end

    private

    def post_params
        params.require(:post).permit(:content)
    end 

