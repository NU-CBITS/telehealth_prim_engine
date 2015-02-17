module TelehealthPrimEngine
  # One of the questions to be presented as part of pre screening.
  class PreScreeningQuestion < ActiveRecord::Base
    belongs_to :pre_screening,
               foreign_key: :telehealth_prim_engine_pre_screening_id,
               class_name: "TelehealthPrimEngine::PreScreening",
               inverse_of: :questions
    has_many :answers,
             class_name: "TelehealthPrimEngine::PreScreeningAnswer",
             foreign_key: :telehealth_prim_engine_pre_screening_question_id,
             inverse_of: :question,
             dependent: :destroy
    has_many :responses,
             class_name: "TelehealthPrimEngine::PreScreeningQuestionResponse",
             foreign_key: :telehealth_prim_engine_pre_screening_question_id,
             inverse_of: :question,
             dependent: :restrict_with_exception

    validates :pre_screening, :label, :position, presence: true
    validates :label, length: { maximum: 60 }
    validates :position,
              numericality: { only_integer: true, greater_than: 0 },
              uniqueness: { scope: :telehealth_prim_engine_pre_screening_id }
  end
end
