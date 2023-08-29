class RegularUsers::DashboardController < ApplicationController
    before_action :authenticate_user!

    def index
        # Lógica para mostrar información específica para usuarios regulares
    end
end