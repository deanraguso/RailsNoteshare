class NotesController < ApplicationController
    before_action :note_instance, only: [:show, :destroy, :edit, :update] 
    before_action :cu, only: [:index]
    
    def index
        @notes = Note.all.order(created_at: :desc)
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
        @note.destroy
        redirect_to root_path
    end
    def update
        if @note.update(params[:note].permit(:title,:body))
            redirect_to @note
        else
            render 'edit'
        end
    end
    def edit
    end
    def show
    end

    private 
    def note_params
        params.require(:note).permit(:title, :body)
    end
    def note_instance
        @note = Note.find(params[:id])
    end
    def cu
        @cu = current_user
    end
end
