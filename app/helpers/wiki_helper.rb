# frozen_string_literal: true

# Helpers method for WikiController
module WikiHelper
  def number?(string)
    true if Float(string)
  rescue StandardError
    false
  end
end
