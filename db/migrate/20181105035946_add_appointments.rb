class AddAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table(:appointments) do |t|
      t.timestamp :date
      t.references :pet
    end
  end
end
