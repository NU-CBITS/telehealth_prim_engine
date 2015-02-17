module TelehealthPrimEngine
  # The collection of responses by a participant to pre screening questions.
  class PreScreeningResponseSet < ActiveRecord::Base
    belongs_to :pre_screening,
               foreign_key: :telehealth_prim_engine_pre_screening_id,
               class_name: "TelehealthPrimEngine::PreScreening",
               inverse_of: :response_sets
    belongs_to :participant,
               foreign_key: :telehealth_prim_engine_participant_id,
               class_name: "TelehealthPrimEngine::Participant",
               inverse_of: :pre_screening_response_set
    has_many :responses,
             class_name: "TelehealthPrimEngine::PreScreeningQuestionResponse",
             foreign_key: :telehealth_prim_engine_pre_screening_response_set_id,
             inverse_of: :response_set,
             dependent: :restrict_with_exception

    validates :pre_screening, :completed_at, :participant, presence: true
  end
end
