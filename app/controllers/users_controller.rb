class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = "Welcome to Alpha Blog #{@user.user}"
            redirect_to articles_path
        else
            redirect_to 'new'
        end
    end


    def user_params
        params.require(:user).permit(:user,:email,:password)
    end

end