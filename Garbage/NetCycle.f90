program NC
  implicit none
  integer :: i, j, k

  do i = 1, 5
    do j = 1, i
      write(*, '(A)', advance='no') '*'
    end do
    print *, ' '
  end do

  print *, ' '

  do i = 5, 1, -1
    do j = 1, i
      write(*, '(A)', advance='no') '*'
    end do
    print *, ' '
  end do

  print *, ' '

  do i = 1, 5
    do j = 1, 5
      write (*, '(A)', advance='no') '*'
    end do
    print *, ' '
  end do

  print *, ' '

  do i = 1, 5
    do j = 1, 5
      if (i == 1) then
        write(*, '(A)', advance='no') '*'
      else if (i == 5) then
        write(*, '(A)', advance='no') '*'
      else if (j == 1 .or. j == 5) then
        write(*, '(A)', advance='no') '*'
      else
        write(*, '(A)', advance='no') ' '
      end if
    end do
    print *, ' '
  end do

end program NC
