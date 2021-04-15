class ValidateInput
  def self.check_size(n)
    if !n.odd? || n < 3 || n >= 100
      puts 'RE-ENTER INPUT PARAMETERS'
    end
  end
end 
