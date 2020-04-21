class RelationshipsController < ApplicationController
    def follow
      current_user.follow(params[:id])
      redirect_to users_path
    end

    def unfollow
      current_user.unfollow(params[:id])
      redirect_to users_path
    end

    def follow_index
    end

    def followers_index
    end

end

