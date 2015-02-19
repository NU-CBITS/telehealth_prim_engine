class CreateTelehealthPrimEngineConsentNotifications < ActiveRecord::Migration
  def change
    create_table :telehealth_prim_engine_consent_notifications do |t|
      t.references :telehealth_prim_engine_participant,
                   index: {
                     unique: true,
                     name: "index_consent_notifications_on_participant_id"
                   },
                   null: false
      t.timestamp :sent_at, null: false
      t.references :telehealth_prim_engine_consent_form,
                   index: { name: "index_consent_notifications_on_consent_form_id" },
                   null: false

      t.timestamps null: false
    end
    add_foreign_key :telehealth_prim_engine_consent_notifications,
                    :telehealth_prim_engine_participants
    add_foreign_key :telehealth_prim_engine_consent_notifications,
                    :telehealth_prim_engine_consent_forms
  end
end
