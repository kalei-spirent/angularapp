class NetworkProfilesController < ApplicationController

	skip_before_filter :verify_authenticity_token

	def show
		@nps = NetworkProfile.all
		render :json => @nps
	end

	def create
		name = params[:name]
		np = NetworkProfile.new
		np.name = name
		np.save
		render :json => { "STATUS" => "OK "}
	end

	def destroy
		name = params[:name]
		np = NetworkProfile.find_by(name: name)

		if np
			np.delete
		end

		render :json => { "STATUS" => "OK "}
	end
end
