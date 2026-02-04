program SimpleNumbers
    use SimpFunc
    implicit none

    integer :: user_enter

    print *, "Enter your integer number"
    read (*,*) user_enter

    if (is_prime(user_enter)) then
        print *, user_enter, "is a prime number"
    else 
        print *, user_enter, "isn't a prime number"
    end if

    call primes_to(user_enter)
end program SimpleNumbers