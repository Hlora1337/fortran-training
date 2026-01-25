program PWS
  use sub
  implicit none
  character(len=20) :: name
  integer :: a, b, summing

  print *, "Enter your name"
  read (*,*) name

  call hi(name)

  print *, "Enter number"
  read (*,*) a
  print *, "Enter another number"
  read (*,*) b

  call sums(a, b, summing)
end program PWS
