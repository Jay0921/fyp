# == Schema Information
#
# Table name: comments
#
#  id           :bigint           not null, primary key
#  message      :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  recipient_id :integer
#  sender_id    :integer
#
# Indexes
#
#  index_comments_on_recipient_id  (recipient_id)
#  index_comments_on_sender_id     (sender_id)
#
class Comment < ApplicationRecord
  belongs_to :sender, class_name: :User, foreign_key: :sender_id
  belongs_to :recipient, class_name: :User, foreign_key: :recipient_id
end
