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

ActiveRecord::Schema.define(version: 20171013015738) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alumnos", force: :cascade do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.string   "rut"
    t.integer  "codigo_carrera"
    t.integer  "semestre"
    t.integer  "ano"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "areas", force: :cascade do |t|
    t.string   "Nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "autos", force: :cascade do |t|
    t.string   "nombre"
    t.string   "modelo"
    t.integer  "cantidad_ruedas"
    t.text     "descripcion"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "convenios", force: :cascade do |t|
    t.string   "Descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "empresas", force: :cascade do |t|
    t.string   "Nombre"
    t.string   "Rut"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "evaluacions", force: :cascade do |t|
    t.integer  "pregunta_1"
    t.integer  "pregunta_2"
    t.integer  "pregunta_3"
    t.integer  "pregunta_4"
    t.integer  "pregunta_5"
    t.integer  "pregunta_6"
    t.integer  "pregunta_7"
    t.integer  "pregunta_8"
    t.text     "observacion"
    t.date     "fecha_e"
    t.float    "nota"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "herramienta", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "herramientas", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "practicas", force: :cascade do |t|
    t.date     "fecha_inicio"
    t.date     "fecha_termino"
    t.text     "descripcion_p"
    t.integer  "alumno_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["alumno_id"], name: "index_practicas_on_alumno_id", using: :btree
  end

  create_table "profesional_guia", force: :cascade do |t|
    t.string   "rut"
    t.string   "Nombre"
    t.string   "Cargo"
    t.string   "Email"
    t.string   "Direccion"
    t.string   "Telefono"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rols", force: :cascade do |t|
    t.string   "Nombre_Rol"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seguimientos", force: :cascade do |t|
    t.date     "fecha_visita_1"
    t.text     "comentario_visita_1"
    t.date     "fecha_visita_2"
    t.text     "comentario_visita_2"
    t.date     "fecha_visita_3"
    t.text     "comentario_visita_3"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "practicas", "alumnos"
end
