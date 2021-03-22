class NotesController < ApplicationController
    before_action :note_instance, only: [:show, :destroy, :edit, :update] 
    before_action :current_uid, only: [:index]
    
    def index
        if user_signed_in?
            @notes = Note.all.order(created_at: :desc)
        else
            redirect_to new_user_session_url
        end
    end
    def new
        if user_signed_in?
            @note = Note.new
        else
            redirect_to new_user_session_url
        end
    end
    def create
        @note = Note.new(note_params)

        if @note.save
            redirect_to @note
        else
            render 'new'
        end
    end
    def destroy
        @note.destroy
        redirect_to root_path
    end
    def update
        if @note.update(params[:note].permit(:title,:body))
            redirect_to @note
        else
            redirect_to new_user_session_url
        end 
    end
    def edit
    end
    def show
    end

    private 
    def note_params
        params.require(:note).permit(:title, :body).merge(user_id: current_user.id)
    end
    def note_instance
        @note = Note.find(params[:id])
    end
    def current_uid
        if user_signed_in?
            @current_uid = current_user.id
        else
            "Not Logged In"
        end
    end
end
