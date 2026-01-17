module euclid_mod
  implicit none

  contains
    pure function gcd_mod(a,b) result(gcd)
      integer, intent(in) :: a, b
      integer :: gcd
      integer :: x, y, temp

      x = abs(a)
      y = abs(b)

      do while (y /= 0)
        temp = y
        y = mod(x,y)
        x = temp
      end do

      gcd = x
    end function gcd_mod
end module euclid_mod

program euclid
  use euclid_mod
  implicit none

  integer :: x, y, result

  print *, "Enter first number (X)"
  read (*,*) x

  print *, "Enter second number (Y)"
  read (*,*) y

  result = gcd_mod(x, y)
  print *, "Euclid algorithm answer: ", result
end program euclid
