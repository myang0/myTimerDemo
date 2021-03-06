class SessionsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by_uname(params[:session][:uname])
        if @user && @user.authenticate(params[:session][:password])
            session[:user_id] = @user.id
            session[:user_name] = @user.uname
            redirect_to '/welcome'
        else
            redirect_to '/login'
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to '/'
    end

end
