# == Schema Information
#
# Table name: cats
#
#  id          :bigint(8)        not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
  COLOR = ['black', 'grey', 'white', 'orange', 'mixed']
  validates :sex, :inclusion => { :in => ['M', 'F'] }, presence: true
  validates :color, :inclusion => { :in => COLOR }, presence: true
  validates :birth_date, :name, :description, presence: true

  has_many :cat_rental_requests,
    foreign_key: :cat_id,
    class_name: :CatRentalRequest,
    dependent: :destroy

  def self.colors
    COLOR
  end
end
