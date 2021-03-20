class NotesController < ApplicationController
    def index
        @notes = Note.all
    end
    def create
        @note = Note.new(note_params)
    end
    def destroy
    end
    def updated
    end
    def show
    end
end
