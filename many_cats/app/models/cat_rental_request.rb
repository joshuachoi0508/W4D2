# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint(8)        not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ApplicationRecord
    validates :status, :inclusion => { :in => ['PENDING', 'APPROVED', 'DENIED'] }, presence: true
    validates :start_date, :end_date, presence: true

    belongs_to :cat,
      foreign_key: :cat_id,
      class_name: :Cat
end
