module math_reverse
  implicit none
  contains
    pure function reverse(num) result(reversed)
      integer, intent(in) :: num
      integer :: reversed, original

      original = abs(num)
      reversed = 0

      do while (original > 0)
        reversed = reversed * 10 + mod(original, 10)
        original = original / 10
      end do

      if (num < 0) then
        reversed = -reversed
      end if
    end function reverse
end module math_reverse

program number_reverse
  use math_reverse
  implicit none

  integer :: input_number, reversed_number

  print *, "Enter number"
  read *, input_number
  reversed_number = reverse(input_number)
  print *, "Яeverse is: ", reversed_number
end program number_reverse
