class SessionsController < ApplicationController

    before_action :require_sign_in, only: [:destroy]

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        if @user.save
            login!(@user)
            redirect_to subs_url
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def destroy
        logout!
        redirect_to new_session_url
    end

    def user_params
        params.require(:user).permit(:username, :password)
    end

end
