# == Schema Information
#
# Table name: lists
#
#  id            :integer          not null, primary key
#  title         :string           not null
#  author_id     :integer          not null
#  list_topic_id :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class List < ActiveRecord::Base
  validates :title, :author, :topic, presence: true
  validates :topic, uniqueness: { scope: :author }

  belongs_to(
    :author,
    class_name: 'User',
    foreign_key: :author_id,
    primary_key: :id
  )

  belongs_to(
    :topic,
    class_name: 'ListTopic',
    foreign_key: :list_topic_id,
    primary_key: :id
  )

  has_many(
    :list_items,
    class_name: 'ListItem',
    foreign_key: :list_id,
    primary_key: :id,
    dependent: :destroy
  )


end
