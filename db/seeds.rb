# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Crear un usuario administrador
admin = User.create!(
    first_name: 'Esteban',
    last_name: 'Reyes',
    position: 'Administrator',
    department: 'Gerencia RR.HH',
    bio: 'Administrador del portal',
    email: 'admin@email.com',
    password: 'admin123',
    password_confirmation: 'admin123',
    role: 'admin'
)

# Crea una oferta de trabajo simulada
job_offer = JobOffer.create(
    title: 'Desarrollador de Software',
    description: 'Estamos buscando un desarrollador de software altamente motivado...',
    requirements: 'Experiencia en Ruby on Rails, conocimientos en bases de datos...',
    user_id: User.admin.first.id # Reemplaza esto con el ID del administrador correspondiente
)

user = User.regular.first # Asegúrate de que el método "regular" devuelva los usuarios regulares
job_offer = JobOffer.first

# Crea una postulación simulada
apply = Apply.create(
    user: user,
    job_offer: job_offer,
    message: 'Estoy interesado en esta posición y creo que soy un buen candidato.',
    status: 'pending' # Cambia esto según corresponda
)