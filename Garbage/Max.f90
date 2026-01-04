program maxing
  implicit none
  integer :: num1, num2, num3, max

  print *, 'Enter the first integer'
  read(*,*) num1

  print *, 'Enter the second integer'
  read(*,*) num2

  print *, 'Enter the third integer'
  read(*,*) num3

  max = 0

  if (num1 > max) then
    max = num1
  end if

  if (num2 > max) then
    max = num2
  end if

  if (num3 > max) then
    max = num3
  end if

  print *, 'Max number is: ', max

end program maxing
