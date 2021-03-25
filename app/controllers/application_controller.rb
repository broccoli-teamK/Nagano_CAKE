class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_customer!,except: [:top, :about]
    
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
        root_path
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
