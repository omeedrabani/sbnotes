class NotesController < ApplicationController
	# http_basic_authenticate_with name: "admin", password: "cs48S15G05*"

	def index
		# @notes = Note.all
		@notes = current_user.notes
	end

	def show
		if logged_in?
			if Note.exists?(params[:id])
				@note = Note.find(params[:id])
			else
				redirect_to '/notes'
			end
		else
			redirect_to '/'
		end
	end

	def new
		@note = Note.new
	end

	def edit
		@note = Note.find(params[:id])
	end	

	def create
		@note = Note.new(note_params)

		if @note.save
			redirect_to @note
		else 
			render 'new'
		end
	end

	def update
		@note = Note.find(params[:id])

		if @note.update(note_params)
			redirect_to @note
		else
			render 'edit'
		end
	end

	def destroy
		@note = Note.find(params[:id])
		@note.destroy

		redirect_to notes_path
	end

	private
		def note_params
			params.require(:note).permit(:title, :text, :user_id)
		end

end
