class RegularUsers::JobOffersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_job_offer, only: [:show]

    def index
        @job_offers = JobOffer.all
    end
    
    def show
        @applies = @job_offer.applies
        @new_apply = Apply.new # Para el formulario de nueva postulación
    end

    private

    def set_job_offer
        @job_offer = JobOffer.find(params[:id])
    end
end

