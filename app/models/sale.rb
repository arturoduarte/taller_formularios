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

class Sale < ApplicationRecord
	# validates :cod, uniqueness: true
	validates :detail, presence: true
	
	validates :value, numericality: { only_integer: true, greater_than: 0  }
	validates :discount,numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 40  }
	
	validates :category, inclusion: { in: %w(uno dos tres cuatro cinco),
	message: "%{value} no es una opción válida" }
end


