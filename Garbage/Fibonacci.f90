module fibonacci_module
  implicit none

  contains
    pure function fibonacci(n) result(fib)
      integer, intent(in) :: n
      integer :: fib
      integer :: a, b, i

      if (n<=0) then
        fib = 0
        return
      else if (n==1) then
        fib = 1
        return
      end if

      a = 0
      b = 1
      do i = 2, n
        fib = a + b
        a = b
        b = fib
      end do
    end function fibonacci
end module fibonacci_module

program fibonacci_test
  use fibonacci_module
  implicit none
  integer :: i, amount

  print *, "How many Fibs you want?"
  read (*,*) amount

  do i = 0, amount
    print *, "F(", i, ") =", fibonacci(i)
  end do
end program fibonacci_test
