class CreateTelehealthPrimEngineConsentSignings < ActiveRecord::Migration
  def change
    # create_table :telehealth_prim_engine_consent_signings do |t|
    #   t.references :telehealth_prim_engine_participant, index: {:unique=>true}
    #   t.references :telehealth_prim_engine_consent_form, index: {:unique=>true}
    #   t.boolean :consent
    #   t.boolean :consent_to_future_research
    #   t.string :initials, limit: 10
    #   t.timestamp :signed_at

    #   t.timestamps null: false
    # end
    # add_foreign_key :telehealth_prim_engine_consent_signings, :telehealth_prim_engine_participants
    # add_foreign_key :telehealth_prim_engine_consent_signings, :telehealth_prim_engine_consent_forms
  end
end
