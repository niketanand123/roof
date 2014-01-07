class String
  def convert_to_phone
    unless self.nil?
      number = self.gsub(/\s+/, '').gsub(/[^0-9A-Za-z]/, '')

      number.to_s
    end

  end


  def format_phone
    unless (self.nil? || self.empty?)
      return "#{self[0,3]}-#{self[3,3]}-#{self[6,4]}"
    end
  end
end