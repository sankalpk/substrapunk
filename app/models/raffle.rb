class Raffle < ApplicationRecord
    validates_presence_of :address
    def update_has_bird!
        self.has_bird = in_kanaria_collection(kanaria_response)
        save!
    end

    def kanaria_response
        JSON.parse(
            HTTP.get("https://kanaria.rmrk.app/api/account/#{address}")
                .body
                .to_s
        )
    end

    def in_kanaria_collection(response)
      response.size > 0 && response.any? { |obj| obj['id'].include? "KANBIRD" }
    end
end