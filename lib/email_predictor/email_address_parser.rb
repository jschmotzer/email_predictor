module EmailPredictor

  class EmailAddressParser
    attr_accessor :name, :email_address, :pattern

    def initialize(name, email_address, pattern=nil)
      @name = name
      @email_address = email_address
      @pattern = pattern
    end

    def name_format_in_email(email_address)
      email_address.split('@').first
    end

    def first_name_dot_last_name(name)
      name.split(' ').join('.').downcase
    end

    def first_name_dot_last_initial(name)
      (name.split(' ').first + '.' + name.split(' ').last[0]).downcase
    end

    def first_initial_dot_last_name(name)
      (name.split(' ').first[0] + '.' + name.split(' ').last).downcase
    end

    def first_initial_dot_last_initial(name)
      (name.split(' ').first[0] + '.' + name.split(' ').last[0]).downcase
    end

    #Compares stored email with potential email pattern
    #Returns found email pattern
    def find_email_pattern
      if name.split(' ').join('.').downcase == name_format_in_email(email_address)
        :first_name_dot_last_name
      elsif (name.split(' ').first + '.' + name.split(' ').last[0]).downcase == name_format_in_email(email_address)
        :first_name_dot_last_initial
      elsif (name.split(' ').first[0] + '.' + name.split(' ').last).downcase == name_format_in_email(email_address)
        :first_initial_dot_last_name
      elsif (name.split(' ').first[0] + '.' + name.split(' ').last[0]).downcase == name_format_in_email(email_address)
        :first_initial_dot_last_initial      
      end
    end


  end
end