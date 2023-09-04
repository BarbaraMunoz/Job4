class Admin::UsersController < ApplicationController
    before_action :authenticate_admin!

    def index
        if params[:query].present?
            search_query = "%#{params[:query]}%" # Agregar % al principio y al final para búsqueda parcial
    
            @users = User.where(role: 'regular')
                        .where("first_name ILIKE ? OR last_name ILIKE ?", search_query, search_query)
                        .order(created_at: :desc)
        else
            @users = User.where(role: 'regular').order(created_at: :desc)
        end

        @pagy, @users = pagy(@users) # Gema pagy
    end

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

    def show
        @user = User.find(params[:id])
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to admin_users_path, notice: 'Usuario eliminado con éxito.'
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :position, :department, :bio, :role)
    end
end
