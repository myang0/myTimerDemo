class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        newName = @user.uname
        if User.where(uname: newName).count <= 0
            if @user.save
                redirect_to '/login'
            end
        end

        redirect_to '/signup'

    end

    private
        def user_params
            params.require(:user).permit(:uname, :password)
        end

end
