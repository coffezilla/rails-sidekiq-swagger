class ApplicationController < ActionController::API
	rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

	private

	def render_not_found(exception)
		render json: { error: "Not Found", message: exception.message }, status: :not_found
	end
end
