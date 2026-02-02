program MT
  implicit none
  integer :: n, i, j
  integer, allocatable :: matrix(:, :)

  print *, "Enter multiplication table size"
  read (*,*) n

  allocate(matrix(n, n))

  do i = 1, n
    do j = 1, n
      matrix(i, j) = i * j
    end do
  end do

  print *, "Multiplication table is: "
  do i = 1, n
    print *, matrix(i, 1:n)
  end do

  deallocate(matrix)

end program MT
