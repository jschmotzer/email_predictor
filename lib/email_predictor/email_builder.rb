module EmailPredictor

  class EmailBuilder
    attr_accessor :target_name, :email_address_pattern, :company_domain

    def initialize(target_name, company_domain, email_address_pattern)
      @target_name = target_name
      @company_domain = company_domain
      @email_address_pattern = email_address_pattern
    end

    #Generates email address from a defined email pattern
    def generate_email
      formatted_name = email_address_pattern.method(email_address_pattern.pattern).call(Person.new(target_name))
      construct_email_address(formatted_name)
    end

    private

    def construct_email_address(formatted_name)
      "#{formatted_name}#{email_address_suffix}"
    end

    def email_address_suffix
      "@#{company_domain}"
    end 
    
  end
end