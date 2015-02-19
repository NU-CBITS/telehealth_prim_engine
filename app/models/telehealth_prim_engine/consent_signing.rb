module TelehealthPrimEngine
  # Record of the consent form signed by a participant.
  class ConsentSigning < ActiveRecord::Base
    belongs_to :telehealth_prim_engine_participant
    belongs_to :telehealth_prim_engine_consent_form
  end
end
