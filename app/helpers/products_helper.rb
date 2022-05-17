module ProductsHelper

    def date_format(date)
        date.strftime('%FT%T')
    end

    def simple_description(description)
        description.truncate(20)
    end

end
