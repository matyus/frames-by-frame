require './lib/twitter_client.rb'

namespace :tweet do
  desc "TODO"
  task update: :environment do
    film = Film.find(1)

    film.increment!

    command = `ffmpeg -ss #{film.timestamp} -i public/#{film.source_file} -s #{film.size} -an -vframes 1 tmp/snapshots/#{film.source_file}-#{film.timestamp}-%05d.jpg`

    api = TwitterClient.build

    file = File.open("./tmp/snapshots/Driller-killer_512kb_subtitles.mp4-#{film.timestamp}-00001.jpg")

    api.update_with_media(nil, file, {})
  end
end
