class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    
    protected

    def after_sign_in_path_for(resource)
      case resource
      when Customer
        customers_my_page_path(resource)
      when Admin
        admin_path
      end
    end

    def after_sign_up_path_for(resource)
        root_path(resource)
    end

    def after_sign_out_path_for(resource)
      if resource == :customer
        root_path
      elsif resource == :admin
        new_admin_session_path
      else
        root_path
      end
    end

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [
            :email,
            :last_name,
            :first_name,
            :last_name_kana,
            :first_name_kana,
            :postal_code,
            :address,
            :phone_number
            ])
    end
end
