# teacher with there specialization and servies
class Teacher < Person
  def initialize(_specialization)
    super()
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
