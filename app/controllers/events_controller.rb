class EventsController < ApplicationController
    def create
     
        @thisevent = Event.new(event_params)
        @thisevent.user_id = current_user.id
        @thisevent.attendee_id = current_user.id
        if @thisevent.save
            
            redirect_to "/users/#{current_user.id}"
        else
            flash[:errors] = @thisevent.errors.full_messages
            redirect_to "/users/#{current_user.id}"
        end
    end
    private
    def event_params
        params.require(:event).permit(:name, :location, :state, :date)
    end
end
