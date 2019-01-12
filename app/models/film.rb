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
#

class Film < ApplicationRecord
  def timestamp
    "#{'%02d' % self.hours}:#{'%02d' % self.minutes}:#{'%02d' % self.seconds}.#{ '%04d' % self.milliseconds}"
  end

  def increment
    if self.milliseconds >= 990
      self.seconds += 1
      self.milliseconds = 0
    else
      self.milliseconds += 30
    end

    if self.seconds >= 59
      self.minutes += 1
      self.seconds = 0
      self.milliseconds = 0
    end

    if self.minutes >= 59
      self.hours += 1
      self.minutes = 0
      self.seconds = 0
      self.milliseconds = 0
    end
  end

  def increment!
    self.increment
    self.save!
  end
end
