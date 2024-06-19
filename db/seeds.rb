# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

list = List.create(name: "TODO")
list.todos.create([{ name: "Study English" }, { name: "Drink Water" }])

list = List.create(name: "In Progress")
list.todos.create([{ name: "Study Ruby", category: 1 }, { name: "Drink Coffee" }])
list = List.create(name: "DONE")
list.todos.create([{ name: "Pay bills" }])
list = List.create(name: "Abandoned")