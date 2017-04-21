class Api::V1::TripsController < ApplicationController

	before_action :authenticate_request

	def index
		@trips = Trip.where(group: current_user.groups.ids)
		render json: @trips.to_json
	end

	def create

	end
end