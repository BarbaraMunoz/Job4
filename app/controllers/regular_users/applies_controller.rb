class RegularUsers::AppliesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_applies

  def index
    @applied_job_offers = @applies.map(&:job_offer)
  end

  def show
    @job_offer = JobOffer.find(params[:id])
  end

  def create
    @job_offer = JobOffer.find(params[:job_offer_id])
    @apply = current_user.applies.build(job_offer: @job_offer)

    if @apply.save
      create_notification(@apply.user, @apply.job_offer)
      redirect_to regular_users_job_offer_path(@job_offer), notice: 'Has sido postulado exitosamente'
    else
      redirect_to regular_users_job_offer_path(@job_offer), alert: 'Ya te has postulado a esta oferta'
    end
  end

  private

  def set_user_applies
    @applies = current_user.applies
  end

  def create_notification(user, job_offer)
    Notification.create(user: job_offer.user, job_offer: job_offer, content: "#{user.full_name} ha postulado a #{job_offer.title}")
  end
end





