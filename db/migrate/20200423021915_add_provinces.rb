class AddProvinces < ActiveRecord::Migration[6.0]
  PROVINCES = %w[PE NL NS	NB MB QC ON SK AB BC YT NT NU].freeze

  def up
    PROVINCES.each do |province|
      Province.create(name: province)
    end
  end
end
