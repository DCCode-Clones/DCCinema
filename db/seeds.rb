# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

movies = Movie.create([{ name: 'Star Wars', imgURL: "https://i.blogs.es/26ba45/star-wars-eras/1366_2000.jpeg", start_date: Date.current, end_date: Date.tomorrow },
                    { name: 'Los Simpsons', imgURL: "https://phantom-marca.unidadeditorial.es/ff129bbe4e38ec6dd131e989f544d6bf/resize/1320/f/jpg/assets/multimedia/imagenes/2021/03/04/16148576621458.jpg", start_date: Date.current, end_date: Date.tomorrow },
                    { name: 'Spiderman', imgURL: "https://upload.wikimedia.org/wikipedia/commons/9/90/Spiderman.JPG", start_date: Date.current, end_date: Date.tomorrow }])

schedules = Schedule.create([{ time: "matine", room: 1, seats: Array.new(48) { 0 }, day: Date.current, movie: movies.first },
                            { time: "matine", room: 2, seats: Array.new(48) { 0 }, day: Date.tomorrow, movie: movies.first }])
