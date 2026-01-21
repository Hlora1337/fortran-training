program array_input
    implicit none
    integer, dimension(3, 4) :: matrix
    integer :: i, j

    print *, "Enter 12 integers for a 3x4 matrix:"
    read (*,*) ((matrix(i,j), j=1,4), i=1,3)

    print *, "Matrix contents:"
    do i = 1, 3
        print *, (matrix(i,j), j=1,4)
    end do
end program array_input
