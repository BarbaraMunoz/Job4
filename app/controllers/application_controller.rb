class ApplicationController < ActionController::Base


    def authenticate_admin!
        unless current_user&.admin?
            redirect_to root_path, alert: 'Access denied.'
        end
    end

    def after_sign_in_path_for(resource)
        if resource.admin?
            admin_dashboard_path
        else
            regular_users_dashboard_path
        end
    end
end
