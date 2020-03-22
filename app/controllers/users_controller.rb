class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def edit
        @user = User.find(params[:id])
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = "Welcome to Alpha Blog #{@user.user}"
            redirect_to articles_path
        else
            render 'new'
        end
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:success]= "Your account was updated successfully"
            redirect_to controller: articles_path
        else
            render 'edit'
        end
    end

    def user_params
        params.require(:user).permit(:user,:email,:password)
    end

end