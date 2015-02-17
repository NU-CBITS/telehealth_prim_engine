class CreateTelehealthPrimEnginePreScreeningQuestions < ActiveRecord::Migration
  def change
    create_table :telehealth_prim_engine_pre_screening_questions do |t|
      t.references :telehealth_prim_engine_pre_screening,
                   index: { name: "index_pre_screening_questions_on_pre_screening_id" },
                   null: false
      t.string :label, limit: 60, null: false
      t.integer :position, null: false

      t.timestamps null: false
    end
    add_foreign_key :telehealth_prim_engine_pre_screening_questions,
                    :telehealth_prim_engine_pre_screenings
    add_index :telehealth_prim_engine_pre_screening_questions,
              [:telehealth_prim_engine_pre_screening_id, :position],
              unique: true,
              name: "index_pre_screening_questions_on_pre_screening_id_and_position"
  end
end
