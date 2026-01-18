program table
  implicit none
  integer :: i, j, result

  do i = 1, 10
    do j = 1, 10
      print *, i, "multiply", j, "is: ", i * j
    end do
    print *, " "
  end do

  end program table
