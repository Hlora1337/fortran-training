program guess
  implicit none
  integer :: number
  integer :: try
  real :: random_num

  call random_seed()

  call random_number(random_num)
  number = int(random_num * 100) + 1

  do while (number /= try)
    print *, "Tell your guess"
    read (*,*) try
    if (number == try) then
      print *, "You guessed, yay!"
      exit
    else
      print *, "Try again, hehe haha"
    end if
  end do

end program guess
