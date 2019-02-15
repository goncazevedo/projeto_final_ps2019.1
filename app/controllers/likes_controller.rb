class LikesController < ApplicationController
    load_and_authorize_resource
    before_action :find_post

    def create
        if already_liked?
            @like = @post.likes.where(user_id: current_user.id)
            @like.destroy(@like.ids)
        else
            @post.likes.create(user_id: current_user.id)
            @dislike = @post.dislikes.where(user_id: current_user.id)
            if @dislike
                @post.dislikes.destroy(@dislike)
            end
        end

        redirect_to post_path(@post)
    end

    def destroy
        @like.destroy
        redirect_to post_path(@post)
    end

    private  
        def find_post
            @post = Post.find(params[:post_id])
        end

        def already_liked?
            Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
        end

end
