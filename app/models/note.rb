require 'elasticsearch/model'

class Note < ActiveRecord::Base
	include Elasticsearch::Model
	include Elasticsearch::Model::Callbacks

	belongs_to :user
	validates :title, presence: true

	def self.search(search)
	  if search
	    self.where("title like ?", "%#{search}%")
	  else
	    self.all
	  end
	end
end

Note.import #for autosync thing with elasticsearch
