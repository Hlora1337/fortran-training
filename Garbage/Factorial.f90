program factorial
  use, intrinsic :: iso_fortran_env, only: int64
  integer(int64) :: n, result
  integer :: i

  print *, "Enter your number"
  read (*,*) n

  result = 1
  do i = 1, n
    result = result * i
  end do

  print *, "Factorial is: ", result

end program factorial
