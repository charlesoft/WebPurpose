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

		@purpose.start_date = Date.new(purpose_params['start_date(1i)'].to_i, purpose_params['start_date(2i)'].to_i,purpose_params['start_date(3i)'].to_i)
		@purpose.end_date = Date.new(purpose_params['end_date(1i)'].to_i, purpose_params['end_date(2i)'].to_i,purpose_params['end_date(3i)'].to_i)

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
			if @purpose.update_attributes(purpose_params)
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
