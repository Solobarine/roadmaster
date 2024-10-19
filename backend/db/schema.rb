# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 20_241_019_091_338) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness',
                                                    unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.string 'service_name', null: false
    t.bigint 'byte_size', null: false
    t.string 'checksum'
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'active_storage_variant_records', force: :cascade do |t|
    t.bigint 'blob_id', null: false
    t.string 'variation_digest', null: false
    t.index %w[blob_id variation_digest], name: 'index_active_storage_variant_records_uniqueness', unique: true
  end

  create_table 'brands', force: :cascade do |t|
    t.bigint 'manufacturer_id'
    t.string 'name'
    t.text 'description'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['manufacturer_id'], name: 'index_brands_on_manufacturer_id'
  end

  create_table 'customers', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'jti', null: false
    t.string 'first_name'
    t.string 'last_name'
    t.string 'phone'
    t.string 'address'
    t.string 'city'
    t.string 'state'
    t.string 'zip_code'
    t.index ['email'], name: 'index_customers_on_email', unique: true
    t.index ['jti'], name: 'index_customers_on_jti', unique: true
    t.index ['reset_password_token'], name: 'index_customers_on_reset_password_token', unique: true
  end

  create_table 'manufacturers', force: :cascade do |t|
    t.string 'name'
    t.string 'country'
    t.integer 'founded_year'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'jti', null: false
    t.string 'first_name'
    t.string 'last_name'
    t.string 'phone'
    t.string 'position'
    t.date 'hire_date'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['jti'], name: 'index_users_on_jti', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  create_table 'vehicles', force: :cascade do |t|
    t.bigint 'brand_id', null: false
    t.string 'name'
    t.integer 'year'
    t.string 'body_type'
    t.string 'engine_type'
    t.string 'fuel_type'
    t.string 'transmission'
    t.string 'drivetrain'
    t.integer 'horsepower'
    t.integer 'torque'
    t.integer 'seating_capacity'
    t.decimal 'cargo_capacity', precision: 10, scale: 2
    t.decimal 'fuel_economy_city', precision: 5, scale: 2
    t.decimal 'fuel_economy_highway', precision: 5, scale: 2
    t.decimal 'safety_rating', precision: 3, scale: 1
    t.decimal 'msrp', precision: 10, scale: 2
    t.string 'vin'
    t.string 'trim_level'
    t.string 'exterior_color'
    t.string 'interior_color'
    t.integer 'mileage'
    t.string 'condition'
    t.text 'features'
    t.string 'registration_state'
    t.date 'registration_expiry'
    t.string 'warranty_status'
    t.decimal 'price'
    t.string 'status'
    t.string 'location'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['brand_id'], name: 'index_vehicles_on_brand_id'
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'active_storage_variant_records', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'brands', 'manufacturers'
  add_foreign_key 'vehicles', 'brands'
end
