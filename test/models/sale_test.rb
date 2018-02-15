# == Schema Information
#
# Table name: sales
#
#  id         :integer          not null, primary key
#  cod        :integer
#  detail     :string
#  category   :integer
#  value      :integer
#  discount   :integer
#  tax        :integer
#  total      :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class SaleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
