require './lib/twitter_client.rb'

namespace :tweet do
  desc "Seek to the latest frame, export it, and then tweet it"
  task next: :environment do
    film = Film.find(1)

    return if film.timestamp == film.length

    film.increment!

    command = `ffmpeg -ss #{film.timestamp} -i public/#{film.source_file} -s #{film.size} -an -vframes 1 tmp/snapshots/#{film.source_file}-#{film.timestamp}-%05d.jpg`

    api = TwitterClient.build

    file = File.open("./tmp/snapshots/#{film.source_file}-#{film.timestamp}-00001.jpg")

    api.update_with_media(nil, file, {})

    cleanup = `rm tmp/snapshots/*`
  end
end
