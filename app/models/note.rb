class Note < ActiveRecord::Base

	belongs_to :user
	validates :title, presence: true

	def self.search(search)
	  query = "%#{search}%"
	  if search
	    self.where("title ILIKE ? or text ILIKE ?", query, query)
	  else
	    self.all
	  end
	end
end

