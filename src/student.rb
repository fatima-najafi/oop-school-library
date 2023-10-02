require_relative 'Person'

class Student < Person
  def initialize(name, age, classroom)
    super(name, age)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
