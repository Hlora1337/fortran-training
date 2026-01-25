module func
  use, intrinsic :: iso_fortran_env, only: real64
  implicit none

  contains
  function factor(n) result (fac)
    integer, intent(in) :: n
    integer :: fac
    integer :: j
    fac = 1
    do j = 1, n
      fac = fac * j
    end do
    print *, "Factorial is: ", fac
  end function factor

  function eveness(m) result(even)
    integer, intent(in) :: m
    logical :: even
    if (mod(m, 2) == 0) then
      even = .True.
    else
      even = .False.
    end if
    print *, "Number even is: ", even
  end function eveness

  function BS (o, p) result (check)
    integer, intent(in) :: o, p
    logical :: check
    if (o > p) then
      check = .True.
    else
      check = .False.
    end if
    print *, check
  end function BS

  pure function calculate_distance(x1, y1, z1, x2, y2, z2) result(distance)
    real(kind=real64), intent(in) :: x1, y1, z1
    real(kind=real64), intent(in) :: x2, y2, z2
    real(kind=real64) :: distance

    distance = sqrt((x2 - x1)**2 + (y2 - y1)**2 + (z2 - z1)**2)
  end function calculate_distance

end module func
