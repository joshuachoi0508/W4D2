class Cat < ApplicationRecord
  COLOR = ['black', 'grey', 'white', 'orange', 'mixed']
  validates :sex, :inclusion => { :in => ['M', 'F'] }, presence: true
  validates :color, :inclusion => { :in => COLOR }, presence: true
  validates :birth_date, :name, :description, presence: true
  
  def self.colors
    COLOR
  end
end
