class PostsController < ApplicationController

    before_action :require_sign_in

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        @post.author_id = @current_user.id
        if @post.save
            redirect_to post_url(@post.id) #check what path you are in (create)
        else
            flash.now[:errors] = @post.errors.full_messages
            render :new
        end
    end

    def edit
        @post = Post.find_by(id: params[:id])
        render :edit
    end

    def update
        @post = Post.find_by(id: params[:id])
        if @post.update(post_params)
            redirect_to post_url(@post.id)
        else
            flash.now[:errors] = @post.errors.full_messages
            render :edit
        end
    end

    def show
        @post = Post.find_by(id: params[:id])
        render :show
    end

    def post_params
        params.require(:post).permit(:title, :url, :content, :sub_id)
    end

end
