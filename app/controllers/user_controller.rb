class UserController < ApplicationController
    def index
    end
    def create
        @thisuser = User.new(user_params)
        if @thisuser.save
            session[:user_id] = @thisuser.id
            redirect_to "/users/#{@thisuser.id}"
        else
            flash[:errors] = @thisuser.errors.full_messages
            redirect_to ('/')
        end
    end
    def show
        @events = Event.all  #where(user_id=current_user.id)
        @eventsnot = Event.all    #where.not(user_id=current_user.id)
    end
    def edit
    end
    def update
        @thisuser = User.find(params[:id])
        if @thisuser.update user_params
          redirect_to "/users/#{@thisuser.id}"
        else
          flash[:errors] = @thisuser.errors.full_messages     
          redirect_to "/users/#{@thisuser.id}/edit"
        end
    end
    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :city, :state, :password)
    end
end
