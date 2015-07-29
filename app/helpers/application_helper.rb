module ApplicationHelper

	def checkCredential
		@log_user ||= session[:user_id] if session[:user_id].present?
	end
end
