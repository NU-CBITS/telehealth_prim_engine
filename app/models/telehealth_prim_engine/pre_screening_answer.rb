module TelehealthPrimEngine
  # One of the options for a pre screening question response.
  class PreScreeningAnswer < ActiveRecord::Base
    KINDS = %w( boolean )

    belongs_to :question,
               foreign_key: :telehealth_prim_engine_pre_screening_question_id,
               class_name: "TelehealthPrimEngine::PreScreeningQuestion",
               inverse_of: :answers
    has_many :responses,
             class_name: "TelehealthPrimEngine::PreScreeningQuestionResponse",
             foreign_key: :telehealth_prim_engine_pre_screening_answer_id,
             inverse_of: :answer,
             dependent: :restrict_with_exception

    validates :question, :position, :label, :value, :kind, presence: true
    validates :eligible, inclusion: { in: [true, false] }
    validates :kind, inclusion: { in: KINDS }
    validates :label, length: { maximum: 60 }
    validates :value, :kind, length: { maximum: 36 }
    validates :position,
              numericality: { only_integer: true, greater_than: 0 },
              uniqueness: {
                scope: :telehealth_prim_engine_pre_screening_question_id
              }
  end
end
