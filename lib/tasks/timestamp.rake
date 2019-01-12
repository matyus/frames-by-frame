namespace :timestamp do
  desc "Update the timestamp"
  task update: :environment do
    handler = TimeHandler.build

    puts handler.get_timestamp

    puts handler.display

    puts handler.set_timestamp

    puts handler.display
  end

end
