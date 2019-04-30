# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'pry'
class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students
  
  def self.search(string)
    if string.length == 0
      Student.all
    else
      @students = []
      Student.all.each do |student|
        if student.name.include?(string.capitalize) == true
          @students << student
        else
          #Do nothing!
        end
      end
      @students
    end
  end
end
