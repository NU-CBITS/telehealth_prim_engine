class CreateTelehealthPrimEngineConsentForms < ActiveRecord::Migration
  def change
    create_table :telehealth_prim_engine_consent_forms do |t|
      t.date :expires_on, null: false
      t.string :study_number, limit: 36, null: false
      t.string :version, limit: 36, null: false

      t.timestamps null: false
    end
    add_index :telehealth_prim_engine_consent_forms,
              [:study_number, :version],
              unique: true,
              name: "index_consent_forms_on_study_number_and_version"
  end
end
