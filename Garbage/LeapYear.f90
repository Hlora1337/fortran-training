program leap
  implicit none
  integer :: year

  print *, 'Write a year'
  read (*,*) year

  if (mod(year, 4) == 0) then
    print *, 'Year is leap'
  else
    print *, "Year isn't leap"
  end if

end program leap
