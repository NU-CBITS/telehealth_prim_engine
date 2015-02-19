module TelehealthPrimEngine
  # Form available to a participant to indicate consent.
  class ConsentForm < ActiveRecord::Base
    has_many :notifications,
             class_name: "TelehealthPrimEngine::ConsentNotification",
             foreign_key: :telehealth_prim_engine_consent_form_id,
             inverse_of: :consent_form,
             dependent: :restrict_with_exception

    validates :expires_on, :study_number, :version, presence: true
    validates :study_number, :version, length: { maximum: 36 }
    validates :version, uniqueness: { scope: :study_number }
  end
end
