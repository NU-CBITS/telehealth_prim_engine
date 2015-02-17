module TelehealthPrimEngine
  # A person being tracked by the application.
  class Participant < ActiveRecord::Base
    has_one :pre_screening_response_set,
            class_name: "TelehealthPrimEngine::PreScreeningResponseSet",
            foreign_key: :telehealth_prim_engine_participant_id,
            inverse_of: :participant,
            dependent: :restrict_with_exception

    validates :external_id,
              presence: true,
              length: { maximum: 36 },
              uniqueness: true
  end
end
