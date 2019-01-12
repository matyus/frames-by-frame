# README


## Dependencies

- Ruby (`2.3.7`) on Rails (`5.2`)
- [`ffmpeg`](https://www.ffmpeg.org/)
- [twitter developer account](https://developer.twitter.com/en.html)


## Getting started

### Install the application

    bundle install

### Films

The video file should not be committed, it should probably live in `public/` or outside the app completely. Just make sure you adjust the file paths in [`lib/tasks/tweet.rake`](lib/tasks/tweet.rake)
### Snapshots

The thumbnails are created in `tmp/` and then deleted after they are tweeted.

### Seed the database

Use the [`db/seeds.rb`](db/seeds.rb) file to setup your first film.

#### Development

    bundle exec rake db:seed

#### Production

    RAILS_ENV=production bundle exec rake db:see

### Twitter API

Open the credentials file, Rails will create it for you if it doesn't exist:

    EDITOR="vim" bin/rails credentials:edit

Then add your keys:

    twitter_001_consumer_key: <consumer key>
    twitter_001_consumer_key_secret: <consumer key secret>
    twitter_001_access_token: <access token>
    twitter_001_access_token_secret: <access token secret>


### Initialize the Cron

I had trouble here and I'm not sure whether this matters or not (it adds a bunch of stuff to the top of the cron file that helps cron use the right version of Ruby, etc.).

    rvm cron setup

This will schedule the task to run every minute, as per [`config/schedule.rb`](config/schedule.rb)

    whenever --update-crontab

This will kick off the `crontab`, you can verify it by running `crontab -e`

