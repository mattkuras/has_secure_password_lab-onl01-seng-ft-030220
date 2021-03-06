class SessionsController < ApplicationController

    def new
    end

    def create
        @user = User.find_by(name: params[:user][:name])

        if @user 
            user = @user.try(:authenticate, params[:user][:password])
            return redirect_to(controller: 'sessions', action: 'new') unless user
            session[:user_id] = @user.id
        else 
            redirect_to(controller: 'sessions', action: 'new')
        end       
    end

end