# == Schema Information
#
# Table name: films
#
#  id               :integer          not null, primary key
#  title            :string
#  hours            :integer
#  minutes          :integer
#  seconds          :integer
#  milliseconds     :integer
#  source_file      :string
#  output_directory :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  size             :string
#  length           :string
#

require 'test_helper'

class FilmTest < ActiveSupport::TestCase
  test "default film" do
    film = build_stubbed(:film)

    assert_equal film.hours, 0
    assert_equal film.minutes, 0
    assert_equal film.seconds, 0
    assert_equal film.milliseconds, 0
    assert_equal film.timestamp, "00:00:00.0000"
  end

  test "default film incremement by one" do
    film = build_stubbed(:film)

    film.increment

    assert_equal film.hours, 0
    assert_equal film.minutes, 0
    assert_equal film.seconds, 0
    assert_equal film.milliseconds, 60
    assert_equal film.timestamp, "00:00:00.0060"
  end

  test "increment into first second" do
    film = build_stubbed(:film, :last_millisecond)

    film.increment

    assert_equal film.hours, 0
    assert_equal film.minutes, 0
    assert_equal film.seconds, 1
    assert_equal film.milliseconds, 0
    assert_equal film.timestamp, "00:00:01.0000"
  end

  test "increment into mid-second" do
    film = build_stubbed(:film,
      hours: 0,
      minutes: 0,
      seconds: 1,
      milliseconds: 300
    )

    film.increment

    assert_equal film.hours, 0
    assert_equal film.minutes, 0
    assert_equal film.seconds, 1
    assert_equal film.milliseconds, 360
    assert_equal film.timestamp, "00:00:01.0360"
  end

  test "increment into second second" do
    film = build_stubbed(:film,
      hours: 0,
      minutes: 0,
      seconds: 1,
      milliseconds: 990
    )

    film.increment

    assert_equal film.hours, 0
    assert_equal film.minutes, 0
    assert_equal film.seconds, 2
    assert_equal film.milliseconds, 0
    assert_equal film.timestamp, "00:00:02.0000"
  end

  test "increment into first minute" do
    film = build_stubbed(:film, :last_second)

    film.increment

    assert_equal film.hours, 0
    assert_equal film.minutes, 1
    assert_equal film.seconds, 0
    assert_equal film.milliseconds, 0
    assert_equal film.timestamp, "00:01:00.0000"
  end

  test "increment mid-minute" do
    film = build_stubbed(:film,
      hours: 0,
      minutes: 1,
      seconds: 30,
      milliseconds: 990
    )

    film.increment

    assert_equal film.hours, 0
    assert_equal film.minutes, 1
    assert_equal film.seconds, 31
    assert_equal film.milliseconds, 0
    assert_equal film.timestamp, "00:01:31.0000"
  end

  test "increment into second minute" do
    film = build_stubbed(:film,
      hours: 0,
      minutes: 1,
      seconds: 59,
      milliseconds: 000
    )

    film.increment

    assert_equal film.hours, 0
    assert_equal film.minutes, 2
    assert_equal film.seconds, 0
    assert_equal film.milliseconds, 0
    assert_equal film.timestamp, "00:02:00.0000"
  end

  test "increment into first hour" do
    film = build_stubbed(:film, :last_minute)

    film.increment

    assert_equal film.hours, 1
    assert_equal film.minutes, 0
    assert_equal film.seconds, 0
    assert_equal film.milliseconds, 0
    assert_equal film.timestamp, "01:00:00.0000"
  end

  test "increment into mid-hour" do
    film = build_stubbed(:film,
      hours: 1,
      minutes: 31,
      seconds: 59,
      milliseconds: 990
    )

    film.increment

    assert_equal film.hours, 1
    assert_equal film.minutes, 32
    assert_equal film.seconds, 0
    assert_equal film.milliseconds, 0
    assert_equal film.timestamp, "01:32:00.0000"
  end

  test "increment into second hour" do
    film = build_stubbed(:film,
      hours: 1,
      minutes: 59,
      seconds: 59,
      milliseconds: 990
    )

    film.increment

    assert_equal film.hours, 2
    assert_equal film.minutes, 0
    assert_equal film.seconds, 0
    assert_equal film.milliseconds, 0
    assert_equal film.timestamp, "02:00:00.0000"
  end
end
