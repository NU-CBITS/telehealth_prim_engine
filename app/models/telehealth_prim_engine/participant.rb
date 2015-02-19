module TelehealthPrimEngine
  # A person being tracked by the application.
  class Participant < ActiveRecord::Base
    has_one :pre_screening_response_set,
            class_name: "TelehealthPrimEngine::PreScreeningResponseSet",
            foreign_key: :telehealth_prim_engine_participant_id,
            inverse_of: :participant,
            dependent: :restrict_with_exception
    has_one :consent_notification,
            class_name: "TelehealthPrimEngine::ConsentNotification",
            foreign_key: :telehealth_prim_engine_participant_id,
            inverse_of: :participant,
            dependent: :restrict_with_exception

    validates :external_id,
              presence: true,
              length: { maximum: 36 },
              uniqueness: true

    def consent_notification_sent?
      !consent_notification.nil?
    end

    def consent_notification_sent_at
      consent_notification.sent_at
    end
  end
end
