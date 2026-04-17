class ApplicationController < ActionController::API
	rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

	def set_name
		random_number = rand(1..1000)
		"User_#{random_number}"
	end

	private

	def render_not_found(exception)
		render json: { error: "Not Found", message: exception.message }, status: :not_found
	end


end
