class Note < ActiveRecord::Base

	belongs_to :user
	validates :title, presence: true

	def self.search(search)
	  query = "%#{search}%"
	  if search
	    self.where("title like ? or text like ?", query, query)
	  else
	    self.all
	  end
	end
end

