# ask for loan amount, apr, and term from user
# set the answers equal to a variable
# input variables into correct calculation
# calculate monthly interest rate
# finally input all info to calculate monthly payment
# output monthly payment

Kernel.puts("Welcome to the car loan calculator!")
Kernel.puts("Let's get started!")

loan_amount = ''
term_length = ''
apr = ''
loop do
  loop do
    Kernel.puts("Please enter the total loan amount:")
    loan_amount = Kernel.gets().chomp().to_i
    if loan_amount.to_i != 0
      break
    else
      Kernel.puts("You must enter a valid number")
    end
  end

  loop do
    Kernel.puts("Please enter your term length (in months)")
    term_length = Kernel.gets().chomp().to_i
    if term_length != 0
      break
    else
      Kernel.puts("You must enter a valid number")
    end
  end

  loop do
    Kernel.puts("Please enter your APR annual percentage rate:")
    Kernel.puts("(enter in decimal form I.E. 10% = .10)")
    apr = Kernel.gets().chomp().to_f
    if apr != 0
      break
    else
      Kernel.puts("You must enter a valid number")
    end
  end

  monthly_interest = apr / 12

  monthly_payment =
    (loan_amount *
    (monthly_interest / (1 - (1 + monthly_interest)**(-term_length))))

  Kernel.puts("Your monthly payment is:")
  Kernel.puts(monthly_payment)

  Kernel.puts("Would you like to calculate another payment?")
  Kernel.puts("Enter 'y' for another calculation and 'n' to exit")
  answer = Kernel.gets().chomp()

  break unless answer.downcase().start_with?('y')
end

Kernel.puts("Thank you for using mortgage calculator!")
Kernel.puts("Goodbye!")
