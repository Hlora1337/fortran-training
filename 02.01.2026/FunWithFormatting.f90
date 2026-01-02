program FormatTest
  implicit none
  integer :: i
  real :: r
  character (len=10) :: char1

  i = 1987
  r = 1337.228
  char1 = "Sosal? Ebal"

  write (*, '(I5)') i
  write (*, '(I3)') i
  write (*, '(F8.4)') r
  write (*, '(F3.2)') r
  write (*, '(A)') char1
  write (*, '(A8)') char1
  write (*, '(I5, F8.10, A)') i, r, char1

end program FormatTest
