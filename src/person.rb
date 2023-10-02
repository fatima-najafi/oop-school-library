class Person
  def initialize(name = 'Unknown', age = 0, parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_accessor :name, :age
  attr_reader :id

  def can_use_services?
    of_age || @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end

  def validate_name
    @name = 'Unknown' if @name == ''
  end
end
