class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to '/login'
        else
            redirect_to '/signup'
        end
    end

    private
        def user_params
            params.require(:user).permit(:uname, :password)
        end

end
