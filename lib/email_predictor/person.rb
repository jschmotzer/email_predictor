module EmailPredictor
  class Person
    attr_reader :name

    def initialize(name)
      @name = name
    end

    def first_name
      @first_name ||= name.split(' ').first
    end

    def last_name
      @last_name ||= name.split(' ').last
    end

    def first_initial
      first_name[0]
    end

    def last_initial
      last_name[0]
    end

  end
end