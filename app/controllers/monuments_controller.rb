class MonumentsController < ApplicationController

	def index
		@monuments = Monument.all
	end

	def update
		
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

	def destroy

	end

	private

	def monument_params
		params.require(:monument).permit(:name, :description, :image)
	end


end
