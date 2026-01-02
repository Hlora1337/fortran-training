program Calc
  implicit none
  real :: num1, num2, sum, sub, mult, div

  print *, 'Enter first number'
  read (*,*) num1
  print *, 'Enter second number'
  read (*,*) num2

  sum = num1 + num2
  sub = num1 - num2
  mult = num1 * num2
  div = num1 / num2

  print *, sum, sub, mult, div

end program Calc
