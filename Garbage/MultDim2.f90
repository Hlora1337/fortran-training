program md2
  implicit none
  integer, dimension(3,3) :: array
  integer :: i, j

  print *, "Fill the matrix"
  read (*,*) ((array(i,j), j=1, 3), i=1, 3)

  print *, sum(array)

end program md2
