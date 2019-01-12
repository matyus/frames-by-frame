# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Film.create(
  title: 'The Driller Killer',
  source_file: 'Driller-killer_subtitles.mp4',
  size: '416x240',
  output_directory: 'build',
  hours: 0,
  minutes: 0,
  seconds: 0,
  milliseconds: 0
)
