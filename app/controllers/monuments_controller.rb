class MonumentsController < ApplicationController

	def index
		@monuments = Monument.all
	end

	def new
		@monument = Monument.new
	end

	def show
		
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
		if @monument.picture
			@monument.image.each do |image|
				Image.create(@monument.image)
			end
		end

		respond_to do |format|
		  if @monument.save
		    format.html { redirect_to @monument, notice: 'monument was successfully created.' }
		    format.json { render action: 'show', status: :created, location: @monument }
		  else
		    format.html { render action: 'new' }
		    format.json { render json: @monument.errors, status: :unprocessable_entity }
		  end
		end
	end

	def update
	  respond_to do |format|
	    if @monument.update(monument_params)
	      format.html { redirect_to @monument, notice: 'User was successfully updated.' }
	      format.json { head :no_content }
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

	def monument_params
		params.require(:monument).permit(:name, :description, :image)
	end


end
