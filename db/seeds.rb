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