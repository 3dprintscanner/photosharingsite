class Monument < ActiveRecord::Base
	has_and_belongs_to_many :collections
	has_many :images

	accepts_nested_attributes_for :images
	validates :name, presence: true
	validates :description, presence: true
end
