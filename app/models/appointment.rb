# == Schema Information
#
# Table name: appointments
#
#  id            :bigint           not null, primary key
#  status        :integer          default("pending")
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  applicant_id  :integer
#  respondent_id :integer
#
# Indexes
#
#  index_appointments_on_applicant_id   (applicant_id)
#  index_appointments_on_respondent_id  (respondent_id)
#
class Appointment < ApplicationRecord
  belongs_to :applicant, class_name: :User, foreign_key: :applicant_id
  belongs_to :respondent, class_name: :User, foreign_key: :respondent_id

  enum status: %i[pending approved rejected canceled]
end
