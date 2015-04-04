class Monument < ActiveRecord::Base
	belongs_to :collection
	has_many :images

	validates :name, presence: true
	validates :description, presence: true
end
