class Admin::JobOffersController < ApplicationController
    before_action :authenticate_admin!
    before_action :set_job_offer, only: [:show, :edit, :update, :destroy]

    def index
        @job_offers = JobOffer.all
    end

    def new
        @job_offer = JobOffer.new
    end
    
    def create
        @job_offer = current_user.job_offers.new(job_offer_params)
    
        if @job_offer.save
            redirect_to admin_job_offers_path, notice: 'Job offer was successfully created.'
        else
            render :new
        end
    end
    
    
    

    def show
    end

    def edit
    end

    def update
        if @job_offer.update(job_offer_params)
            redirect_to admin_job_offer_path(@job_offer), notice: 'Job offer was successfully updated.'
        else
            render :edit
        end
    end

    def destroy
        @job_offer.destroy
        redirect_to admin_job_offers_path, notice: 'Job offer was successfully destroyed.'
    end

    private

    def set_job_offer
        @job_offer = JobOffer.find(params[:id])
    end
    
    def job_offer_params
        params.require(:job_offer).permit(:title, :description, :requirements)
    end
end
