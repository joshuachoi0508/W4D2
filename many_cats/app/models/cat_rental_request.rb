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
    validate :date, :does_not_overlap_approved_requests

    belongs_to :cat,
      foreign_key: :cat_id,
      class_name: :Cat

    def date
      unless self.start_date < self.end_date
        self.errors[:name] << 'Start date needs to be before end date'
      end
    end

    def overlapping_requests
      # .where('(:cat_id == cat_rental_requests.cat_id)', cat_id: self.cat_id)
      # .where('cat_id = ?', self.cat_id)
      # .where('cat_id = :the_cat_id', {the_cat_id: self.cat_id})

      # .where('(:id != cat_rental_requests.id)', id: self.id)

      CatRentalRequest
        .where(cat_id: self.cat_id)
        .where.not(id: self.id)
        .where.not('end_date < ? OR start_date > ?', self.start_date, self.end_date)

        # .where.not('end_date < :start_date OR start_date > :end_date', {start_date: self.start_date, end_date: self.end_date})



        # .where.not('cat_rental_requests.end_date < :start_date OR :end_date < cat_rental_requests.start_date', start_date: self.start_date, end_date: self.end_date)
    end

    def overlapping_approved_requests
      overlapping_requests.where(status: 'APPROVED')
    end

    def does_not_overlap_approved_requests
      if overlapping_approved_requests.exists?
        self.errors[:name] << 'You cannot have overlapping approved requests'
      end
    end
end
