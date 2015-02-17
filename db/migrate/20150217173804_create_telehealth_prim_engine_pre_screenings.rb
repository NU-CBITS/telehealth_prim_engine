class CreateTelehealthPrimEnginePreScreenings < ActiveRecord::Migration
  def change
    create_table :telehealth_prim_engine_pre_screenings do |t|
      t.string :version, limit: 36, null: false

      t.timestamps null: false
    end
    add_index :telehealth_prim_engine_pre_screenings, :version, unique: true
  end
end
