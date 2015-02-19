class DeviseCreateTelehealthPrimEngineUsers < ActiveRecord::Migration
  def change
    create_table(:telehealth_prim_engine_users) do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Lockable
      t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      t.string   :unlock_token # Only if unlock strategy is :email or :both
      t.datetime :locked_at

      t.boolean :superuser, default: false, null: false
      t.boolean :researcher, default: false, null: false
      t.boolean :content_author, default: false, null: false

      t.timestamps
    end

    add_index :telehealth_prim_engine_users, :email,                unique: true
    add_index :telehealth_prim_engine_users, :reset_password_token, unique: true
    add_index :telehealth_prim_engine_users, :unlock_token,         unique: true
  end
end
