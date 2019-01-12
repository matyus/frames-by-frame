require './lib/twitter_client.rb'

namespace :tweet do
  desc "TODO"
  task update: :environment do
    #require './lib/tweet'
    film = Film.find(1)

    film.increment!

    clean_directory = `make clean`

    create_image = `make FILE=Driller-killer_512kb_subtitles.mp4 SIZE=480x360 TIME=#{film.timestamp} seek`

    puts "----------"

    puts create_image

    api = TwitterClient.build

    status = nil
    file = File.open("./tmp/snapshots/Driller-killer_512kb_subtitles.mp4-#{film.timestamp}-00001.jpg")
    options = {}

    api.update_with_media(status, file, options)



  end

end
