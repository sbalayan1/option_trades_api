def create_date(m, d, y)
    Date.strptime("#{m}-#{d}-#{y}", '%m -%d-%Y' )
end