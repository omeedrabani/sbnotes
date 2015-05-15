class NotesController < ApplicationController
	
	##
	#@usage:: show list of notes
	def index
		if logged_in?
			@notes = current_user.notes.order(updated_at: :desc)
		else
			redirect_to '/'
		end
	end

	##
	#@usage:: if note exists and access allowed, show note; otherwise, redirect to index
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

	##
	#@usage:: create new note if logged in
	def new
		if logged_in?
			@note = Note.new
		else
			redirect_to '/'
		end	
	end

	##
	#@usage:: if note exists and access allowed, show note; otherwise, redirect to index
	def edit
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

	##
	#@usage:: create new note if logged in, and save it with the user_id
	def create
		if logged_in?
			@note = Note.new(note_params)
		
			if @note.save
				@note.update_attribute(:user_id, current_user.id)
				redirect_to @note
			else 
				render 'new'
			end
		else
			redirect_to '/'
		end
	end

	##
	#@usage:: edit existing note if logged in
	def update
		if logged_in?
			@note = Note.find(params[:id])

			if @note.update(note_params)
				redirect_to @note
			else
				render 'edit'
			end
		else
			redirect_to '/'
		end
	end

	##
	#@usage:: destroy note if logged in
	def destroy
		if logged_in?
			@note = Note.find(params[:id])
			@note.destroy

			redirect_to notes_path
		else
			redirect_to '/'
		end
	end

	private
		def note_params
			params.require(:note).permit(:title, :text, :user_id)
		end

end
