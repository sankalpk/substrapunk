class CreateRaffles < ActiveRecord::Migration[7.0]
  def change
    create_table :raffles do |t|
      t.string :address, null: false
      t.boolean :submitted_raffle, default: false
      t.boolean :has_bird

      t.timestamps
    end
  end
end
