program DS
  implicit none
  integer :: i, j, n
  real :: diagsum, random_num
  real :: matrix(5,5)

  call random_seed()

  do i = 1, 5
    do j = 1, 5
      call random_number(random_num)
      matrix(i, j) = int(random_num * 100) + 1
    end do
  end do

  diagsum = 0.0

  do i = 1, 5
    diagsum = diagsum + matrix(i, i)
  end do

  print *, diagsum

end program DS
