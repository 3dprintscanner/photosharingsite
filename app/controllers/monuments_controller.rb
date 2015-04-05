class MonumentsController < ApplicationController

	before_action :set_monument, only: [:show, :edit, :update, :destroy]
	respond_to :html

	def index
		@monuments = Monument.all
	end

	def new
		@monument = Monument.new
	end

	def show
		respond_with(@monument)
	end

	def second_part
		@monument_before = monument_params
		@monument = Monument.new
	end

	def confirmation
		@monument = monument_params
	end

	def create
		@monument = Monument.new(monument_params)
		
		respond_to do |format|
		  if @monument.save
		  	if params[:images]
		  		puts "It has #{params[:images].size}images"
		  		binding.pry
		  		params[:images][:images].each do |img|
		  			@monument.images.create(photo: img)
		  			binding.pry
		  			# @monument.images.save
		  		end
		  		# @monument.images.each do |image|
		  		# 	@monument.photo = image
		  		# 	puts @monument.to_json
		  		# 	@monument.photo.save
		  		# end
		  	end
		    format.html { redirect_to @monument, notice: 'monument was successfully created.' }
		    format.json { render action: 'show', status: :created, location: @monument }
		  else
		    format.html { render action: 'new' }
		    format.json { render json: @monument.errors, status: :unprocessable_entity }
		  end
		end
	end
	def edit

	end

	def update
	  respond_to do |format|
	    if @monument.update(monument_params)
	      format.html { redirect_to @monument, notice: 'User was successfully updated.' }
	      format.json { head :no_content }
	      if @monument.image
	      	@monument.image.each do |image|
	      		Image.create(@monument.image)
	      	end
	      end
	    else
	      format.html { render action: 'edit' }
	      format.json { render json: @monument.errors, status: :unprocessable_entity }
	    end
	  end
	end

	# DELETE /users/1
	# DELETE /users/1.json
	def destroy
	  @monument.destroy
	  respond_to do |format|
	    format.html { redirect_to users_url }
	    format.json { head :no_content }
	  end
	end


	private

	def set_monument
	  @monument = Monument.find(params[:id])
	end

	def monument_params
		params.require(:monument).permit(:name, :description, :images)
	end


end
