class Collection < ActiveRecord::Base
	has_and_belongs_to_many :monuments
	belongs_to :user
	
	validates :name, presence: true
	validates :monuments, presence: true
end
