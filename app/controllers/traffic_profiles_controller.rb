class TrafficProfilesController < ApplicationController
	skip_before_filter :verify_authenticity_token

	def show
		@nps = TrafficProfile.all
		render :json => @nps
	end

	def create
		name = params[:name]
		np = TrafficProfile.new
		np.name = name
		np.save
		render :json => { "STATUS" => "OK "}
	end

	def destroy
		name = params[:name]
		np = TrafficProfile.find_by(name: name)

		if np
			np.delete
		end

		render :json => { "STATUS" => "OK "}
	end	
end
