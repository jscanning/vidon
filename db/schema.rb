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

ActiveRecord::Schema.define(version: 2019_05_01_051317) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "customers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "slots"
    t.date "renewal_date"
    t.integer "subscriptions_count"
  end

  create_table "episodes", force: :cascade do |t|
    t.integer "season"
    t.integer "show_id"
    t.integer "episode"
    t.integer "absolute_episode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["show_id"], name: "index_episodes_on_show_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "customer_id"
    t.string "content_type"
    t.integer "content_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_type", "content_id"], name: "index_favorites_on_content_type_and_content_id"
    t.index ["customer_id"], name: "index_favorites_on_customer_id"
  end

  create_table "friend_requests", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "requester_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_friend_requests_on_customer_id"
    t.index ["requester_id"], name: "index_friend_requests_on_requester_id"
  end

  create_table "friendships", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_friendships_on_customer_id"
    t.index ["friend_id"], name: "index_friendships_on_friend_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.integer "payment_id"
    t.decimal "amount", precision: 5, scale: 2
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movie_actors", force: :cascade do |t|
    t.string "name"
    t.integer "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_movie_actors_on_movie_id"
  end

  create_table "movie_genres", force: :cascade do |t|
    t.integer "genre"
    t.integer "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_movie_genres_on_movie_id"
  end

  create_table "movie_ratings", force: :cascade do |t|
    t.integer "movie_id"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "customer_id"
    t.index ["customer_id"], name: "index_movie_ratings_on_customer_id"
    t.index ["movie_id"], name: "index_movie_ratings_on_movie_id"
  end

  create_table "movies", force: :cascade do |t|
    t.integer "producer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["producer_id"], name: "index_movies_on_producer_id"
  end

  create_table "payments", force: :cascade do |t|
    t.string "card_name"
    t.string "card_num"
    t.integer "cvc"
    t.date "expiration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "customer_id"
    t.index ["customer_id"], name: "index_payments_on_customer_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.integer "user_id"
    t.string "user_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remember_digest"
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.index ["user_id", "user_type"], name: "index_people_on_user_id_and_user_type"
    t.index ["username"], name: "index_people_on_username", unique: true
  end

  create_table "producers", force: :cascade do |t|
    t.string "company_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profile_comments", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "commentor_id"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentor_id"], name: "index_profile_comments_on_commentor_id"
    t.index ["customer_id"], name: "index_profile_comments_on_customer_id"
  end

  create_table "rentals", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "movie_id"
    t.datetime "expiration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_rentals_on_customer_id"
    t.index ["expiration"], name: "index_rentals_on_expiration"
    t.index ["movie_id"], name: "index_rentals_on_movie_id"
  end

  create_table "show_actors", force: :cascade do |t|
    t.string "name"
    t.integer "show_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["show_id"], name: "index_show_actors_on_show_id"
  end

  create_table "show_genres", force: :cascade do |t|
    t.integer "show_id"
    t.integer "genre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["show_id"], name: "index_show_genres_on_show_id"
  end

  create_table "show_ratings", force: :cascade do |t|
    t.integer "rating"
    t.integer "show_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "customer_id"
    t.index ["customer_id"], name: "index_show_ratings_on_customer_id"
    t.index ["show_id"], name: "index_show_ratings_on_show_id"
  end

  create_table "shows", force: :cascade do |t|
    t.string "name"
    t.integer "producer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.index ["producer_id"], name: "index_shows_on_producer_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "show_id"
    t.integer "current_episode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "cancel"
    t.index ["customer_id", "show_id"], name: "index_subscriptions_on_customer_id_and_show_id", unique: true
  end

  create_table "video_comments", force: :cascade do |t|
    t.integer "video_id"
    t.integer "customer_id"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_video_comments_on_customer_id"
    t.index ["video_id"], name: "index_video_comments_on_video_id"
  end

  create_table "videos", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "content_id"
    t.string "content_type"
    t.index ["content_id", "content_type"], name: "index_videos_on_content_id_and_content_type"
  end

  create_table "watch_histories", force: :cascade do |t|
    t.integer "progress", default: 0
    t.integer "customer_id"
    t.integer "video_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "completed", default: false
    t.index ["customer_id"], name: "index_watch_histories_on_customer_id"
    t.index ["video_id"], name: "index_watch_histories_on_video_id"
  end

end
