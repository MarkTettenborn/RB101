# mortgage calculator

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(number)
  number.to_i != 0
end

prompt('welcome to our mortgage calculator')

loan_amount = ''

loop do
  prompt('what is the loan amount in GBP?')
  loan_amount = Kernel.gets().chomp()
  if valid_number?(loan_amount)
    break
  end
end

apr = ''

loop do
  prompt('what is the APR?')
  apr = Kernel.gets().chomp()
  if valid_number?(apr)
    break
  end
end

duration_years = ''

loop do
  prompt('what is the loan duration in years?')
  duration_years = Kernel.gets().chomp()
  if valid_number?(duration_years)
    break
  end
end

monthly_rate = apr.to_f / 12 / 100

duration_months = duration_years.to_f() * 12

monthly_payment = loan_amount.to_i * (monthly_rate / (1 - (1 + monthly_rate)**(-duration_months)))

monthly_payment_report = "your monthly payment is #{monthly_payment}"

prompt(monthly_payment_report)
