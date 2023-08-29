class Admin::UsersController < ApplicationController
    before_action :authenticate_admin!

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        @user.password = "password2023"
        @user.password_confirmation = "password2023"
    
        if @user.save
            redirect_to admin_dashboard_path, notice: 'Usuario creado con éxito'
        else
            flash.now[:alert] = 'Hubo un problema al crear el usuario'
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :position, :department, :bio, :role)
    end
end
