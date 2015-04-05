class CollectionsController < ApplicationController

	load_and_authorize_resource
	before_action :set_collection, only: [:show, :edit, :update, :destroy]
	respond_to :html

	def index
	  @categories = Collection.all
	  respond_with(@categories)
	end

	def show
	  respond_with(@collection)
	end

	def new
	  @collection = Collection.new
	  respond_with(@collection)
	end

	def edit
	end

	def create
	  @collection = Collection.new(collection_params)
	  @collection.save
	  respond_with(@collection)
	end

	def update
	  @collection.update(collection_params)
	  respond_with(@collection)
	end

	def destroy
	  @collection.destroy
	  respond_with(@collection)
	end

	private
	  def set_collection
	    @collection = Collection.find(params[:id])
	  end

	  def collection_params
	    params.require(:collection).permit(:name)
	  end
end
