class PurposesController < ApplicationController

	before_action :set_purpose, only: [:show, :edit, :update, :destroy]

	def index
		@purposes = Purpose.all
	end

	def new
		@purpose = Purpose.new
	end

	def create
		@purpose = Purpose.new(purpose_params)

		respond_to do |format|
			if @purpose.save
				format.html {redirect_to @purpose, notice: "Purpose created sucessfully!"}
				format.json {render action: 'show',status: :created, location: @purpose}
			else
				format.html { render action: 'new' }
				format.json { render json: @purpose.errors, status: :unprocessable_entity }
			end
		end
	end

	def show

	end

	def edit

	end

	def update
		respond_to do |format|
			if @purpose.update
				format.html {redirect_to @purpose, notice: "Purpose updated sucessfully!"}
				format.json {render action: 'show',status: :created, location: @purpose}
			else
				format.html { render action: 'new' }
				format.json { render json: @purpose.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@purpose.destroy
		respond_to do |format|
			format.html { redirect_to purposes_path }
			format.json { head :no_content}
		end
	end

	private
	def set_purpose
		@purpose = Purpose.find(params[:id])
	end

	def purpose_params
		params.require(:purpose).permit(:name, :description, :value, :start_date, :end_date, :city)
	end

end
