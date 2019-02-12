class DislikesController < ApplicationController
    before_action :find_post

    def create
        if already_disliked?
            @dislike = @post.dislikes.where(user_id: current_user.id)
            @dislike.destroy(@dislike.ids)
        else
            @post.dislikes.create(user_id: current_user.id)
        end
        redirect_to post_path(@post)
    end

    def destroy
        @dislike.destroy
        redirect_to post_path(@post)
    end

    private  
        def find_post
            @post = Post.find(params[:post_id])
        end

        def already_disliked?
            Dislike.where(user_id: current_user.id, post_id: params[:post_id]).exists?
        end
end
