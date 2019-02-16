class DislikesController < ApplicationController
    load_and_authorize_resource
    before_action :find_post

    def create
        if already_disliked?
            @dislike = @post.dislikes.where(user_id: current_user.id)
            @dislike.destroy(@dislike.ids)
        else
            @post.dislikes.create(user_id: current_user.id)
            @like = @post.likes.where(user_id: current_user.id)
            if @like
                @post.likes.destroy(@like)
            end
        end
        redirect_to request.referrer
    end

    def destroy
        @dislike.destroy
        redirect_to request.referrer
    end

    private  
        def find_post
            @post = Post.find(params[:post_id])
        end

        def already_disliked?
            Dislike.where(user_id: current_user.id, post_id: params[:post_id]).exists?
        end

        def already_liked?
            Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
        end

        def switch_like
            if already_liked?
                return false
            else
                return true
            end
        end
end
