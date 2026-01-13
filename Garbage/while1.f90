program while1
  implicit none
  integer :: i

  do while (i /= 0)
    print *, "Enter the number"
    read (*,*) i
    print *, 'Your number is: ', i
    if (i == 0) then
      exit
    end if
  end do

end program while1
