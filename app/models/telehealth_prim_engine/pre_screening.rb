module TelehealthPrimEngine
  # A set of questions.
  class PreScreening < ActiveRecord::Base
    has_many :questions,
             class_name: "TelehealthPrimEngine::PreScreeningQuestion",
             foreign_key: :telehealth_prim_engine_pre_screening_id,
             inverse_of: :pre_screening,
             dependent: :destroy
    has_many :response_sets,
             class_name: "TelehealthPrimEngine::PreScreeningResponseSet",
             foreign_key: :telehealth_prim_engine_pre_screening_id,
             inverse_of: :pre_screening,
             dependent: :restrict_with_exception

    validates :version,
              length: { maximum: 36 },
              uniqueness: true,
              presence: true
  end
end
