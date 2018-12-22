class UsersController < ApplicationController
    def new
        @user = User.new
    end
    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to user_path(@user.id)
        else
            render 'new'
        end
    end
    
    def show
       #params[:id]
       @user = User.find(params[:id])
       @feeds = Feed.all
       #@favorites_blogs = current_user.favorite_blogs
       #@favorites_blogs = @user.favorites
    end
    
    def new_img
        if params[:back]
          @user_img = Feed.new(feed_params)
        else
          @user_img = Feed.new
        end
    end
    
    private
    
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :image_cache)
    end
    
end
