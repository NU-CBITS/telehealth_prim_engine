module TelehealthPrimEngine
  # An answer selected by a participant for a pre screening question.
  class PreScreeningQuestionResponse < ActiveRecord::Base
    belongs_to(
      :response_set,
      foreign_key: :telehealth_prim_engine_pre_screening_response_set_id,
      class_name: "TelehealthPrimEngine::PreScreeningResponseSet",
      inverse_of: :responses
    )
    belongs_to :question,
               foreign_key: :telehealth_prim_engine_pre_screening_question_id,
               class_name: "TelehealthPrimEngine::PreScreeningQuestion",
               inverse_of: :responses
    belongs_to :answer,
               foreign_key: :telehealth_prim_engine_pre_screening_answer_id,
               class_name: "TelehealthPrimEngine::PreScreeningAnswer",
               inverse_of: :responses

    validates :response_set, :question, :answer, presence: true
  end
end
