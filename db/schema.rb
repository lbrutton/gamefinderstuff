# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  create_table "accounts", force: true do |t|
    t.integer  "tenant_id"
    t.integer  "affiliate_id"
    t.string   "name"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.string   "uuid"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "street"
    t.string   "city"
    t.string   "country"
    t.string   "phone"
    t.string   "skype"
    t.string   "role"
    t.integer  "total_conversions",               default: 0
    t.string   "api_auth_token"
    t.string   "iframe_signup_token"
    t.datetime "iframe_signup_token_expires_at"
    t.string   "activation_state",                default: "active"
    t.string   "activation_token"
    t.datetime "activation_token_expires_at"
    t.integer  "entity_id",                                          null: false
  end

  add_index "accounts", ["activation_token"], name: "index_accounts_on_activation_token", using: :btree
  add_index "accounts", ["api_auth_token"], name: "index_accounts_on_api_auth_token", unique: true, using: :btree
  add_index "accounts", ["iframe_signup_token"], name: "index_accounts_on_iframe_signup_token", using: :btree
  add_index "accounts", ["remember_me_token"], name: "index_ad_accounts_on_remember_me_token", using: :btree
  add_index "accounts", ["reset_password_token"], name: "index_ad_accounts_on_reset_password_token", using: :btree
  add_index "accounts", ["uuid"], name: "index_ad_accounts_on_uuid", unique: true, using: :btree

  create_table "app_assets", force: true do |t|
    t.integer  "app_id"
    t.integer  "asset_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "app_assets", ["app_id"], name: "index_ad_app_assets_on_app_id", using: :btree
  add_index "app_assets", ["asset_id"], name: "index_ad_app_assets_on_asset_id", using: :btree

  create_table "app_themes", force: true do |t|
    t.integer "app_id",   null: false
    t.integer "theme_id", null: false
  end

  add_index "app_themes", ["app_id"], name: "index_app_themes_on_app_id", using: :btree
  add_index "app_themes", ["theme_id"], name: "index_app_themes_on_theme_id", using: :btree

  create_table "apps", force: true do |t|
    t.integer  "account_id"
    t.string   "title"
    t.string   "auth_token"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "store_application_id"
    t.integer  "platform_id"
    t.boolean  "is_active",            default: true,  null: false
    t.string   "api_auth_token"
    t.boolean  "unity",                default: false, null: false
    t.integer  "integration_type_id",  default: 1
    t.datetime "deleted_at"
  end

  add_index "apps", ["api_auth_token"], name: "index_apps_on_api_auth_token", unique: true, using: :btree

  create_table "asset_sets", force: true do |t|
    t.string   "name",                       null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "account_id"
    t.boolean  "selectable", default: false, null: false
  end

  add_index "asset_sets", ["account_id"], name: "index_asset_sets_on_account_id", using: :btree

  create_table "assets", force: true do |t|
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "subtype"
    t.string   "asset_type"
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.integer  "asset_file_size"
    t.datetime "asset_updated_at"
    t.string   "secondary_asset_file_name"
    t.string   "secondary_asset_content_type"
    t.integer  "secondary_asset_file_size"
    t.datetime "secondary_asset_updated_at"
    t.integer  "theme_id"
  end

  add_index "assets", ["asset_type", "subtype"], name: "index_assets_on_asset_type_and_subtype", using: :btree
  add_index "assets", ["theme_id"], name: "index_assets_on_theme_id", using: :btree

  create_table "banner_sets", force: true do |t|
    t.integer  "game_id",                               null: false
    t.string   "name",       limit: 64,                 null: false
    t.boolean  "default",               default: false, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "banner_sets", ["game_id", "name"], name: "index_banner_sets_on_game_id_and_name", unique: true, using: :btree

  create_table "banners", force: true do |t|
    t.integer  "banner_set_id",                           null: false
    t.integer  "width",                                   null: false
    t.integer  "height",                                  null: false
    t.string   "locale",        limit: 2,                 null: false
    t.string   "file_name",                               null: false
    t.string   "fingerprint",   limit: 20,                null: false
    t.boolean  "active",                   default: true, null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "banners", ["banner_set_id", "width", "height", "locale", "fingerprint"], name: "index_banners_on_multiple_fields", unique: true, using: :btree

  create_table "categories", force: true do |t|
    t.integer  "parent_id"
    t.string   "icon"
    t.string   "image"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "ancestry"
    t.integer  "priority",                     default: 0, null: false
    t.integer  "game_categories_count",        default: 0, null: false
    t.integer  "tenant_id"
    t.string   "type"
    t.string   "paperclip_icon_file_name"
    t.string   "paperclip_icon_content_type"
    t.integer  "paperclip_icon_file_size"
    t.datetime "paperclip_icon_updated_at"
    t.string   "paperclip_image_file_name"
    t.string   "paperclip_image_content_type"
    t.integer  "paperclip_image_file_size"
    t.datetime "paperclip_image_updated_at"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "categories", ["ancestry"], name: "index_categories_on_ancestry", using: :btree
  add_index "categories", ["id"], name: "index_categories_on_id", using: :btree
  add_index "categories", ["parent_id"], name: "index_categories_on_parent_id", using: :btree

  create_table "category_detail_translations", force: true do |t|
    t.integer  "language_id"
    t.integer  "category_detail_id"
    t.string   "name"
    t.string   "long_name"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "locale"
  end

  add_index "category_detail_translations", ["category_detail_id", "language_id"], name: "idx_category_detail_translations_1", using: :btree

  create_table "category_details", force: true do |t|
    t.integer  "category_id"
    t.integer  "tenant_id"
    t.string   "icon"
    t.string   "image"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "paperclip_icon_file_name"
    t.string   "paperclip_icon_content_type"
    t.integer  "paperclip_icon_file_size"
    t.datetime "paperclip_icon_updated_at"
    t.string   "paperclip_image_file_name"
    t.string   "paperclip_image_content_type"
    t.integer  "paperclip_image_file_size"
    t.datetime "paperclip_image_updated_at"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "category_details", ["category_id"], name: "index_category_details_on_category_id", using: :btree

  create_table "category_translations", force: true do |t|
    t.integer  "category_id"
    t.integer  "language_id"
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "long_name"
    t.string   "locale"
  end

  add_index "category_translations", ["category_id", "language_id"], name: "index_category_translations_on_category_id_and_language_id", using: :btree

  create_table "features", force: true do |t|
    t.integer  "game_id"
    t.integer  "category_id"
    t.string   "list"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "tenant_id"
  end

  add_index "features", ["game_id", "list", "tenant_id", "category_id"], name: "idx_features_1", using: :btree
  add_index "features", ["list", "category_id"], name: "index_features_on_list_and_category_id", using: :btree

  create_table "filters", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "value_type"
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "filters", ["user_id"], name: "index_filters_on_user_id", using: :btree

  create_table "game_categories", force: true do |t|
    t.integer  "game_id"
    t.integer  "category_id"
    t.string   "label"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "category_type"
    t.integer  "category_tenant_id"
  end

  add_index "game_categories", ["category_id"], name: "index_game_categories_on_category_id", using: :btree
  add_index "game_categories", ["game_id"], name: "index_game_categories_on_game_id", using: :btree

  create_table "game_countries", force: true do |t|
    t.boolean  "is_active",                                default: true
    t.integer  "game_id"
    t.integer  "country_id"
    t.integer  "current_price"
    t.integer  "last_price"
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.datetime "price_updated_at"
    t.decimal  "store_rating",     precision: 2, scale: 1
  end

  add_index "game_countries", ["game_id", "country_id", "is_active"], name: "idx_game_countries_1", using: :btree
  add_index "game_countries", ["game_id", "country_id"], name: "index_game_countries_on_game_id_and_country_id", using: :btree
  add_index "game_countries", ["is_active"], name: "index_game_countries_on_is_active", using: :btree

  create_table "game_detail_screenshots", force: true do |t|
    t.integer  "game_detail_id"
    t.boolean  "first_cell",     default: false, null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "screenshot_id"
    t.integer  "position"
  end

  add_index "game_detail_screenshots", ["game_detail_id", "first_cell"], name: "index_game_detail_screenshots_on_game_detail_id_and_first_cell", using: :btree
  add_index "game_detail_screenshots", ["game_detail_id"], name: "index_game_detail_screenshots_on_game_detail_id", using: :btree

  create_table "game_details", force: true do |t|
    t.integer  "game_id"
    t.integer  "language_id"
    t.string   "title"
    t.text     "description"
    t.text     "review"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.text     "review_pros"
    t.text     "review_cons"
    t.text     "promotional_text"
    t.string   "language_code",      limit: 2
    t.text     "category_names"
    t.string   "video_file_name"
    t.string   "video_content_type"
    t.integer  "video_file_size"
    t.datetime "video_updated_at"
    t.string   "review_url"
  end

  add_index "game_details", ["game_id", "language_code"], name: "index_game_details_on_game_id_and_language_code", unique: true, using: :btree
  add_index "game_details", ["game_id", "language_id"], name: "index_game_details_on_game_id_and_language_id", using: :btree

  create_table "game_device_contexts", force: true do |t|
    t.integer  "game_id"
    t.integer  "device_context_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "game_device_contexts", ["device_context_id"], name: "index_game_device_contexts_on_device_context_id", using: :btree
  add_index "game_device_contexts", ["game_id"], name: "index_game_device_contexts_on_game_id", using: :btree

  create_table "game_languages", force: true do |t|
    t.integer "game_id"
    t.integer "language_id"
    t.string  "locale"
  end

  add_index "game_languages", ["game_id"], name: "index_games_languages_on_game_id", using: :btree
  add_index "game_languages", ["language_id"], name: "index_games_languages_on_language_id", using: :btree

  create_table "game_properties", force: true do |t|
    t.integer  "game_id"
    t.integer  "property_id"
    t.string   "value"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "game_properties", ["game_id"], name: "index_game_properties_on_game_id", using: :btree

  create_table "games", force: true do |t|
    t.string   "name"
    t.string   "publisher"
    t.string   "version"
    t.string   "memory"
    t.string   "age_rating"
    t.string   "icon"
    t.string   "promo_image_portrait"
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.string   "store_application_id"
    t.string   "developer"
    t.integer  "hitfox_rating_id"
    t.date     "release_date"
    t.float    "rank"
    t.boolean  "is_active",                          default: false,     null: false
    t.datetime "activated_at"
    t.string   "type",                               default: "IosGame"
    t.float    "store_rating"
    t.boolean  "is_sponsored",                       default: false,     null: false
    t.string   "promo_image_landscape"
    t.string   "custom_url_scheme"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.string   "promo_image_portrait_file_name"
    t.string   "promo_image_portrait_content_type"
    t.integer  "promo_image_portrait_file_size"
    t.datetime "promo_image_portrait_updated_at"
    t.string   "promo_image_landscape_file_name"
    t.string   "promo_image_landscape_content_type"
    t.integer  "promo_image_landscape_file_size"
    t.datetime "promo_image_landscape_updated_at"
    t.string   "min_os_version"
    t.string   "video_file_name"
    t.string   "video_content_type"
    t.integer  "video_file_size"
    t.datetime "video_updated_at"
  end

  add_index "games", ["created_at", "type"], name: "index_games_on_created_at_and_type", using: :btree
  add_index "games", ["id", "type"], name: "index_games_on_id_and_type", using: :btree
  add_index "games", ["rank", "type"], name: "index_games_on_rank_and_type", using: :btree
  add_index "games", ["release_date", "type"], name: "index_games_on_release_date_and_type", using: :btree
  add_index "games", ["store_application_id", "type"], name: "index_games_on_store_application_id_and_type", using: :btree
  add_index "games", ["type"], name: "index_games_on_payout_score_id_and_type", using: :btree
  add_index "games", ["type"], name: "index_games_on_type", using: :btree
  add_index "games", ["updated_at", "type"], name: "index_games_on_updated_at_and_type", using: :btree

  create_table "gift_elements", force: true do |t|
    t.integer  "position"
    t.boolean  "opened",            default: false, null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "game_id"
    t.integer  "gift_recipient_id"
  end

  create_table "gift_recipients", force: true do |t|
    t.integer  "gift_id"
    t.integer  "recipient_id"
    t.boolean  "opened",       default: false, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "gift_recipients", ["gift_id"], name: "index_gift_recipients_on_gift_id", using: :btree
  add_index "gift_recipients", ["recipient_id"], name: "index_gift_recipients_on_recipient_id", using: :btree

  create_table "gifts", force: true do |t|
    t.integer  "sender_user_id"
    t.string   "message",                    limit: 1024
    t.integer  "gift_wrap_image_id"
    t.integer  "gift_background_image_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "sender_facebook_user_id"
    t.string   "video_message"
    t.string   "audio_message"
    t.datetime "sent_at"
    t.datetime "posted_to_facebook_wall_at"
  end

  add_index "gifts", ["sender_user_id"], name: "index_gifts_on_sender_user_id", using: :btree

  create_table "label_translations", force: true do |t|
    t.integer  "game_category_id"
    t.integer  "language_id"
    t.string   "label"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "locale"
  end

  add_index "label_translations", ["game_category_id", "language_id"], name: "index_label_translations_on_game_category_id_and_language_id", using: :btree

  create_table "news_item_countries", force: true do |t|
    t.integer "country_id",   null: false
    t.integer "news_item_id", null: false
  end

  add_index "news_item_countries", ["country_id"], name: "index_countries_news_items_on_country_id", using: :btree
  add_index "news_item_countries", ["news_item_id"], name: "index_countries_news_items_on_news_item_id", using: :btree

  create_table "news_item_device_contexts", force: true do |t|
    t.integer  "news_item_id"
    t.integer  "device_context_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "news_item_device_contexts", ["device_context_id"], name: "index_news_item_device_contexts_on_device_context_id", using: :btree
  add_index "news_item_device_contexts", ["news_item_id"], name: "index_news_item_device_contexts_on_news_item_id", using: :btree

  create_table "news_item_translations", force: true do |t|
    t.integer  "news_item_id"
    t.integer  "language_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "locale"
  end

  create_table "news_items", force: true do |t|
    t.integer  "game_id"
    t.string   "type"
    t.string   "icon"
    t.boolean  "is_active",                   default: false, null: false
    t.datetime "posted_at"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.integer  "tenant_id"
    t.integer  "platform_id",                                 null: false
    t.integer  "external_id"
    t.string   "paperclip_icon_file_name"
    t.string   "paperclip_icon_content_type"
    t.integer  "paperclip_icon_file_size"
    t.datetime "paperclip_icon_updated_at"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
  end

  add_index "news_items", ["is_active", "posted_at"], name: "index_news_items_on_is_active_and_posted_at", using: :btree
  add_index "news_items", ["platform_id"], name: "index_news_items_on_platform_id", using: :btree

  create_table "permissions", force: true do |t|
    t.integer  "permissionable_id"
    t.string   "permissionable_type"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "permissions", ["permissionable_id", "permissionable_type", "code"], name: "permissions_unique_index", unique: true, using: :btree

  create_table "properties", force: true do |t|
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "property_type"
    t.integer  "position"
    t.string   "default_value"
  end

  create_table "screenshots", force: true do |t|
    t.string   "image"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "image_filename"
    t.string   "type"
    t.string   "paperclip_image_file_name"
    t.string   "paperclip_image_content_type"
    t.integer  "paperclip_image_file_size"
    t.datetime "paperclip_image_updated_at"
  end

  add_index "screenshots", ["image_filename"], name: "index_screenshots_on_image_filename", using: :btree

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: true do |t|
    t.string "name"
  end

  create_table "tenant_games", force: true do |t|
    t.integer  "tenant_id"
    t.integer  "game_id"
    t.boolean  "active",              default: false, null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.datetime "activated_at"
    t.float    "rank"
    t.integer  "unique_clicks_count", default: 0,     null: false
    t.string   "state"
  end

  add_index "tenant_games", ["activated_at", "tenant_id", "state"], name: "index_tenant_games_on_activated_at_and_tenant_id_and_state", using: :btree
  add_index "tenant_games", ["game_id", "tenant_id", "active", "activated_at"], name: "idx_tenant_games_1", using: :btree
  add_index "tenant_games", ["game_id"], name: "index_tenant_games_on_game_id", using: :btree
  add_index "tenant_games", ["tenant_id"], name: "index_tenant_games_on_tenant_id", using: :btree

  create_table "themes", force: true do |t|
    t.string   "name",                            null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "account_id"
    t.boolean  "selectable", default: false,      null: false
    t.string   "type",       default: "SdkTheme"
  end

  add_index "themes", ["account_id"], name: "index_asset_sets_on_account_id", using: :btree

end
