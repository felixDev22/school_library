class Nameable
  def correct_name
    raise NotImplentedError, '#{self.class} has not implemented method'
  end
end
