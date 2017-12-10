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

ActiveRecord::Schema.define(version: 20171122184018) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alumnos", force: :cascade do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.string   "email"
    t.string   "rut"
    t.integer  "codigo_carrera"
    t.integer  "semestre"
    t.integer  "ano"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["user_id"], name: "index_alumnos_on_user_id", using: :btree
  end

  create_table "areas", force: :cascade do |t|
    t.string   "nombre"
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

  create_table "codigos", force: :cascade do |t|
    t.integer  "codigo_carrera"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "convenios", force: :cascade do |t|
    t.string   "nombre"
    t.date     "fecha_inicio"
    t.date     "fecha_termino"
    t.text     "descripcion"
    t.integer  "empresa_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["empresa_id"], name: "index_convenios_on_empresa_id", using: :btree
  end

  create_table "empresas", force: :cascade do |t|
    t.string   "rut_empresa"
    t.string   "nombre_empresa"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
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
    t.date     "fecha_evaluacion"
    t.float    "nota"
    t.float    "nota_informe_practica"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
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
    t.integer  "profesional_guia_id"
    t.integer  "herramienta_id"
    t.integer  "convenio_id"
    t.integer  "empresa_id"
    t.integer  "seguimiento_id"
    t.integer  "evaluacion_id"
    t.integer  "area_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["alumno_id"], name: "index_practicas_on_alumno_id", using: :btree
    t.index ["area_id"], name: "index_practicas_on_area_id", using: :btree
    t.index ["convenio_id"], name: "index_practicas_on_convenio_id", using: :btree
    t.index ["empresa_id"], name: "index_practicas_on_empresa_id", using: :btree
    t.index ["evaluacion_id"], name: "index_practicas_on_evaluacion_id", using: :btree
    t.index ["herramienta_id"], name: "index_practicas_on_herramienta_id", using: :btree
    t.index ["profesional_guia_id"], name: "index_practicas_on_profesional_guia_id", using: :btree
    t.index ["seguimiento_id"], name: "index_practicas_on_seguimiento_id", using: :btree
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

  create_table "roles", force: :cascade do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "seguimientos", force: :cascade do |t|
    t.date     "fecha_1"
    t.text     "comentario_visita_1"
    t.date     "fecha_2"
    t.text     "comentario_visita_2"
    t.date     "fecha_3"
    t.text     "comentario_visita_3"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "semestres", force: :cascade do |t|
    t.integer  "numero_semestre"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "nombre",                 default: "", null: false
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
    t.integer  "role_id"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["role_id"], name: "index_users_on_role_id", using: :btree
  end

  add_foreign_key "practicas", "alumnos"
  add_foreign_key "practicas", "areas"
  add_foreign_key "practicas", "convenios"
  add_foreign_key "practicas", "empresas"
  add_foreign_key "practicas", "evaluacions"
  add_foreign_key "practicas", "profesional_guia", column: "profesional_guia_id"
  add_foreign_key "practicas", "seguimientos"
  add_foreign_key "users", "roles"
end
