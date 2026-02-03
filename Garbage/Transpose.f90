program Trans
  implicit none
  integer :: i, j
  integer :: matrix1(4, 3)
  integer :: matrix2(3, 4)
  real :: random_num

  call random_seed()

  do i = 1, 4
    do j = 1, 3
      call random_number(random_num)
      matrix1(i, j) = int(random_num * 100) + 1
    end do
  end do

  matrix2 = transpose(matrix1)

  print *, matrix1

  print *, matrix2

end program Trans
