class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.integer :applicant_id, index: true, foreign_key: { to_table: :user }
      t.integer :respondent_id, index: true, foreign_key: { to_table: :user }
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
