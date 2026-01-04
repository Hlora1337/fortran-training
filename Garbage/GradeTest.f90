program GradeTest
  implicit none
  integer :: grade

  print *, 'Enter the grade (numbers):'
  read (*,*) grade

  select case (grade)
    case (85:100)
      print *, "A"
    case (70:84)
      print *, "B"
    case (60:69)
      print *, "C"
    case (50:59)
      print *, "D"
    case (0:49)
      print *, "F"
    case default
      print *, "Ayo WTF"
      return
  end select

end program GradeTest
