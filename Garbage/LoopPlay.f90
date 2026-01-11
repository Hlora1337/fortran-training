program LoopPlay
  implicit none
  integer :: i, sum
  real :: random_num
  integer, parameter :: array_size = 10
  integer :: array(array_size)

  sum = 0

  call random_seed()

  do i = 1, array_size
    call random_number(random_num)
    array(i) = int(random_num * 100) + 1
  end do

  do i = 1, array_size
    print *, array(i)
  end do

  do i = 1, array_size
    sum = sum + array(i)
  end do
  print *, "Sum is: ", sum

end program LoopPlay
