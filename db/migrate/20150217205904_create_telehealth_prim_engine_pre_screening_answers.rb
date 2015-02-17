class CreateTelehealthPrimEnginePreScreeningAnswers < ActiveRecord::Migration
  def change
    create_table :telehealth_prim_engine_pre_screening_answers do |t|
      t.references :telehealth_prim_engine_pre_screening_question,
                   index: { name: "index_pre_screening_answers_on_question_id" },
                   null: false
      t.integer :position, null: false
      t.string :label, limit: 60, null: false
      t.string :value, limit: 36, null: false
      t.string :kind, limit: 36, null: false
      t.boolean :eligible, null: false

      t.timestamps null: false
    end
    add_foreign_key :telehealth_prim_engine_pre_screening_answers,
                    :telehealth_prim_engine_pre_screening_questions
    add_index :telehealth_prim_engine_pre_screening_answers,
              [:telehealth_prim_engine_pre_screening_question_id,
               :position],
              unique: true,
              name: "index_pre_screening_answers_on_question_id_and_position"
  end
end
