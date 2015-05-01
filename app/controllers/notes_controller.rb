class NotesController < ApplicationController
	

	def index
		# @notes = Note.all
		if logged_in?
			@notes = current_user.notes.order(updated_at: :desc)
		else
			redirect_to '/'
		end
	end

	def show
		if logged_in?
			if Note.exists?(params[:id]) && current_user.id == Note.find(params[:id]).user_id
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
			@note.update_attribute(:user_id, current_user.id)
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
