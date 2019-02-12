class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?



    protected
        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :age, :board_id, :cell_id, :cell_kind, :board_kind, :photo, :creation_cell])
            devise_parameter_sanitizer.permit(:account_update, keys: [:name, :age, :board_id, :cell_id, :cell_kind, :board_kind, :photo, :creation_cell])
        end

end
