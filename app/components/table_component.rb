# frozen_string_literal: true

class TableComponent < ViewComponent::Base
  def initialize(columns:)
    @columns = columns
  end
end
