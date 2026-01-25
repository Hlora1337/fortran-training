program PWF
  use, intrinsic :: iso_fortran_env, only: real64
  use func
  implicit none
  integer :: n, m, o, p
  integer :: fac
  logical :: even, check
  real(kind=real64) :: x1, x2, y1, y2, z1, z2, distance

  print *, "Enter integer for factorial"
  read (*,*) n

  fac = factor(n)

  print *, "Enter random number"
  read (*,*) m
  even = eveness(m)

  print *, "Enter first number"
  read (*,*) o
  print *, "Enter second number"
  read (*,*) p
  check = BS(o, p)

  print *, "Enter each parameter of first point (x, y, z)"
  read (*,*) x1, y1, z1

  print *, "Enter each parameter of second point"
  read (*,*) x2, y2, z2

  distance = calculate_distance(x1, x2, y1, y2, z1, z2)

  print *, "The distance is: ", distance

end program PWF
