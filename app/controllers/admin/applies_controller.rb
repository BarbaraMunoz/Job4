class Admin::AppliesController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @job_offers_with_applies = JobOffer.joins(:applies).distinct

    @pagy, @job_offers_with_applies = pagy(JobOffer.joins(:applies).distinct)
    
  end

  def show
    @job_offer = JobOffer.find(params[:job_offer_id])
    @applicants = @job_offer.applies.map(&:user)
  end
end

