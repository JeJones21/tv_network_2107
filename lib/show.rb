class Show

  attr_reader :name,
              :creator,
              :characters

  def initialize(name, creator, characters)
    @name = name
    @creator = creator
    @characters = characters
  end

  def total_salary
    @characters.sum do |character|
      character.salary
    end
  end

  def highest_paid_actor
    #find the highest salary...
    @characters.max_by do |character|
      character.salary
    end.actor
  end

  def actors 

  end

end
