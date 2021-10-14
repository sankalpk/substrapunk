class RafflesController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_raffle, only: %i[ show submit ]

    def show
        render json: json
    end

    def submit
        @raffle.update!(submitted_raffle: true)
        render json: json
    end

    def delete_all
      Raffle.all.destroy_all
    end

    private

    def set_raffle
        @raffle = Raffle.find_by_address(params[:address])
        if(@raffle)
            @raffle.update_has_bird!
        else
            @raffle = Raffle.new(address: params[:address])
            @raffle.update_has_bird!
        end
    end

    def json
        {
            address: @raffle.address,
            has_bird: @raffle.has_bird,
            submitted_raffle: @raffle.submitted_raffle
        }
    end
end