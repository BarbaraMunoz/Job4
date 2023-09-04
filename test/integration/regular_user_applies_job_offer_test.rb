require "test_helper"

class RegularUserAppliesJobOfferTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    def setup
        @regular_user = users(:regular_user)
        @job_offer = job_offers(:one)
    end

    test "regular user postula a oferta y verifica en 'mis postulaciones'" do
        # Iniciar sesión como usuario regular
        sign_in @regular_user

        # Acceder a la página de la oferta de trabajo
        get regular_users_job_offer_url(@job_offer)
        # Verificar que está en la página de la oferta de trabajo
        assert_response :success
        assert_select "h1", text: @job_offer.title

        # Hacer clic en botón para aplicar a la oferta
        post regular_users_job_offer_applies_path(@job_offer)

        # Verificar que se ha aplicado correctamente
        assert_response :redirect
        assert_redirected_to regular_users_job_offer_url(@job_offer)
        follow_redirect! # Seguir la redirección para ver el mensaje de éxito
        assert_response :success
        assert_select "p", text: 'Has sido postulado exitosamente'

        # Acceder a la vista 'mis postulaciones' para verificar
        get regular_users_applies_url

        # Verificar que está en la vista 'mis postulaciones'
        assert_response :success
        assert_select "h1", text: "Mis Postulaciones"
        
        # Verificar que la oferta de trabajo aplicada está presente en la lista
        assert_select "ul" do
        assert_select "li", text: @job_offer.title
        end
    end
end

