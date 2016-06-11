class Admin::RegistrationsController < Devise::RegistrationsController
	before_action :configure_devise_permitted_parameters, if: :devise_controller?

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_up).push(:email)
		devise_parameter_sanitizer.for(:account_update).push(:email)
		if params[:action] == 'update'
			devise_parameter_sanitizer.permit(:account_update) { 
				|u| u.permit(registration_params << :current_password)
			}
		elsif params[:action] == 'create'
			devise_parameter_sanitizer.permit(:sign_up) { 
				|u| u.permit(registration_params) 
			}
		end
	end
    # def new
    #   super
    # end

    # def create
    #   super
    # end
end