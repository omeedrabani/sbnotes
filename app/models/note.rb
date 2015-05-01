class Note < ActiveRecord::Base
	belongs_to :user, dependent: :destroy
	validates :title, presence: true
end
