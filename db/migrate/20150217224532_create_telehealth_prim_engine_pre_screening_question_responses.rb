class CreateTelehealthPrimEnginePreScreeningQuestionResponses < ActiveRecord::Migration
  def change
    create_table :telehealth_prim_engine_pre_screening_question_responses do |t|
      t.references :telehealth_prim_engine_pre_screening_response_set,
                   index: { name: "index_pre_screening_responses_on_response_set_id" },
                   null: false
      t.references :telehealth_prim_engine_pre_screening_question,
                   index: { name: "index_pre_screening_responses_on_question_id" },
                   null: false
      t.references :telehealth_prim_engine_pre_screening_answer,
                   index: { name: "index_pre_screening_responses_on_answer_id" },
                   null: false

      t.timestamps null: false
    end
    add_foreign_key :telehealth_prim_engine_pre_screening_question_responses,
                    :telehealth_prim_engine_pre_screening_response_sets
    add_foreign_key :telehealth_prim_engine_pre_screening_question_responses,
                    :telehealth_prim_engine_pre_screening_questions
    add_foreign_key :telehealth_prim_engine_pre_screening_question_responses,
                    :telehealth_prim_engine_pre_screening_answers
  end
end
