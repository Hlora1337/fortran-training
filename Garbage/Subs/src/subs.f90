module sub
  implicit none

  contains
  subroutine hi(name)
    character(len=20), intent(in) :: name
    print *, "hi, ", name
  end subroutine hi

  subroutine sums(a, b, summing)
    integer, intent(in) :: a, b
    integer, intent(out) :: summing
    summing = a + b
    print *, "Sum is: ", summing
  end subroutine
end module sub
