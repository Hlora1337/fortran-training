program ArrayManipulations
  implicit none
  integer, parameter :: n = 10
  integer :: array(n)
  integer :: i
  real :: arrsum, mean
  integer :: positive_count, negative_count

  do i = 1, n
    print *, "Enter integer ", i
    read (*,*) array(i)
  end do

  arrsum = sum(array)
  mean = arrsum / real(n)

  print *, "Sum is: ", arrsum
  print *, "Mean is: ", mean
  print *, "Minimum is: ", minval(array)
  print *, "Maximum is: ", maxval(array)

  positive_count = count(array > 0)
  negative_count = count(array < 0)

  print *, "Positive numbers: ", positive_count
  print *, "Negative numbers: ", negative_count

end program ArrayManipulations
