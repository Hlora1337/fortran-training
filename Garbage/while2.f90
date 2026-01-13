program while2
  implicit none
  integer :: i

  do while (i /= 0)
    print *, "Enter the number"
    read (*,*) i
    print *, 'Your number is: ', i
    if (mod(i, 7) == 0 .or. mod(i, 13) == 0) then
      print *, "ok"
      exit
    end if
  end do

end program while2
