program HMS
  implicit none
  integer :: sec, minute, h

  print *, 'Enter how many seconds do you have'
  read (*,*) sec

  h = 0
  minute = 0

  do while (sec > 60)
    if (sec > 3600) then
      sec = sec - 3600
      h = h + 1
    else
      print *, "Continue"
    end if
    if (sec < 3600) then
        sec = sec - 60
        minute = minute + 1
    else
      print *, "Continue"
    end if
  end do

  print *, h, ':', minute, ':', sec

end program HMS
