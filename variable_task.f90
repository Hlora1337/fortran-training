program variable_task
  implicit none
  character (len = 20) :: name, surname
  double precision :: pi, answer
  real :: radius, C, F

  print *, 'Enter the name'
  read (*,*) name
  print *, 'Enter the surname'
  read (*,*) surname

  print *, surname, name

  pi = 3.14159265358979
  print *, 'Write the radius'
  read (*,*) radius
  answer = pi * radius**2
  print *, 'Answer is: ', answer

  print *, 'How many Celsius we have'
  read (*,*) C
  F = (C * 9/5) + 32
  print *, 'Answer is: ', F
end program variable_task
