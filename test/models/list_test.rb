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

require 'test_helper'

class ListTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
