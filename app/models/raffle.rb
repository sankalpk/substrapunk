class Raffle < ApplicationRecord
    validates_presence_of :address
    def update_has_bird!
        self.has_bird = kanaria_response.size > 0
        save!
    end

    def kanaria_response
        JSON.parse(
            HTTP.get("https://kanaria.rmrk.app/api/account/#{address}")
                .body
                .to_s
        )
    end
end