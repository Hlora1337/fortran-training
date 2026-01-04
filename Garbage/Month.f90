program MonthCheck
  implicit none
  integer :: month
  character(len=1) :: answer

  print *, "Enter the number of the month"
  read (*,*) month

  select case (month)
    case (1)
      print *, "January, 31 day"
    case (2)
      print *, "is year leap or not? (Y/N)"
      read (*,*) answer
      if (answer == 'Y') then
        print *, "February, 29 days"
      else
        print *, "February, 28 days"
      end if
    case (3)
      print *, "March, 31 day"
    case (4)
      print *, "April, 30 days"
    case (5)
      print *, "May, 31 day"
    case (6)
      print *, "June, 30 days"
    case (7)
      print *, "July, 31 day"
    case (8)
      print *, "August, 31 day"
    case (9)
      print *, "September, 30 days"
    case (10)
      print *, "October, 31 day"
    case (11)
      print *, "November, 30 days"
    case (12)
      print *, "December, 31 day"
    case default
      print *, "Fuck you bruh"
  end select

end program MonthCheck
