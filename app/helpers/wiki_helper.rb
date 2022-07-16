module WikiHelper
  def is_number?(string)
    true if Float(string)
  rescue StandardError
    false
  end
end
