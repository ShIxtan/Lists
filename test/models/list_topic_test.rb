# == Schema Information
#
# Table name: list_topics
#
#  id          :integer          not null, primary key
#  author_id   :integer          not null
#  title       :string           not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class ListTopicTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
