class CreateTelehealthPrimEngineParticipants < ActiveRecord::Migration
  def change
    create_table :telehealth_prim_engine_participants do |t|
      t.string :external_id, limit: 36, null: false

      t.timestamps null: false
    end
    add_index :telehealth_prim_engine_participants, :external_id, unique: true
  end
end
