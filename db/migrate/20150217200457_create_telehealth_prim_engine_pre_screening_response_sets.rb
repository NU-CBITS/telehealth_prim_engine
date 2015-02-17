class CreateTelehealthPrimEnginePreScreeningResponseSets < ActiveRecord::Migration
  def change
    create_table :telehealth_prim_engine_pre_screening_response_sets do |t|
      t.references :telehealth_prim_engine_pre_screening,
                   index: { name: "index_pre_screening_response_sets_on_pre_screening_id" },
                   null: false
      t.timestamp :completed_at, null: false
      t.references :telehealth_prim_engine_participant,
                   index: { name: "index_pre_screening_response_sets_on_participant_id" },
                   null: false

      t.timestamps null: false
    end
    add_foreign_key :telehealth_prim_engine_pre_screening_response_sets,
                    :telehealth_prim_engine_pre_screenings
    add_foreign_key :telehealth_prim_engine_pre_screening_response_sets,
                    :telehealth_prim_engine_participants
  end
end
