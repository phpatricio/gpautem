# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

   #roles = Role.create([{ nombre: 'admin' }, { descripcion: 'lo que sea' }])
   #roles = Role.create([{ nombre: 'secretaria' }, { descripcion: 'niuna wea' }])
   Role.create(nombre: 'admin', descripcion: "que sucede")
   Role.create(nombre: 'secretaria', descripcion: "que sucede")
   Role.create(nombre: 'profesorguia', descripcion: "que sucede")
   Codigo.create(codigo_carrera: 21030)
   Codigo.create(codigo_carrera: 21041)
   Semestre.create(numero_semestre: 1)
   Semestre.create(numero_semestre: 2)
