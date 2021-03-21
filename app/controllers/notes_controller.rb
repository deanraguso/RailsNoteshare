class NotesController < ApplicationController
    before_action :note_instance, only: [:show] 

    def index
        @notes = Note.all
    end
    def new
        @note = Note.new
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
    end
    def update
    end
    def show
        @note = Note.find(params[:id])
    end

    private 
    def note_params
        params.require(:note).permit(:title, :body)
    end
    def note_instance
        @note = Note.find(params[:id])
    end
end
