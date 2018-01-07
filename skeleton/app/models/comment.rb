# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text             not null
#  user_id    :integer          not null
#  link_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ApplicationRecord
  validates :body, presence: true
  validates :user, presence: true
  validates :link, presence: true

  belongs_to :user
  
  belongs_to :link
end
