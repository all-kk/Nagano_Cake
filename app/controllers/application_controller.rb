class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name_phonetic])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name_phonetic])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:telephone_number])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:postcode])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:address])
  end
  def after_sign_in_path_for(resource)
    if resource.instance_of?(Admin)
      admin_top_path
    elsif resource.instance_of?(Member)
      member_member_path(current_member.id)
    else
      root_path
    end
  end

  def after_sign_out_path_for(resource)
    if resource == :admin
      new_admin_session_path
    else resource == :member
      root_path
    end
  end
end
