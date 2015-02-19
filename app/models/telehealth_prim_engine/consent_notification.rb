module TelehealthPrimEngine
  # Receipt for the message notifying a participant of the consent form.
  class ConsentNotification < ActiveRecord::Base
    belongs_to :participant,
               class_name: "TelehealthPrimEngine::Participant",
               foreign_key: :telehealth_prim_engine_participant_id,
               inverse_of: :consent_notification
    belongs_to :consent_form,
               class_name: "TelehealthPrimEngine::ConsentForm",
               foreign_key: :telehealth_prim_engine_consent_form_id,
               inverse_of: :notifications

    validates :participant, :consent_form, :sent_at, presence: true
  end
end
