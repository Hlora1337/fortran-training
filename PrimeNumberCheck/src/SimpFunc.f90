module SimpFunc
    implicit none

    contains
    function is_prime(n) result(prime_check)
        use, intrinsic :: iso_fortran_env, only: real64
        implicit none
        integer, intent(in) :: n
        logical :: prime_check
        integer :: i, sqrt_n

        if (n < 2) then
            prime_check = .false.
            return
        end if

        if (n == 2) then
            prime_check = .true.
            return
        end if

        if (mod(n, 2) == 0) then 
            prime_check = .false.
            return
        end if

        sqrt_n = int(sqrt(real(n, real64)))

        do i = 3, sqrt_n, 2
            if (mod(n, i) == 0) then
                prime_check = .false.
                return
            end if
        end do

        prime_check = .true.
    end function is_prime

    subroutine primes_to(n)
        integer, intent(in) :: n
        integer :: i, prime_count

        if (n < 2) then 
            print *, "No prime numbers exist below 2"
            return
        end if

        prime_count = 0

        do i = 2, n
            if (is_prime(i)) then
                write(*, '(I5)', advance='no') i
                prime_count = prime_count + 1

                if (mod(prime_count, 10) == 0) then
                    print *
                end if
            end if 
        end do

        print *
        print *, "There are ", prime_count, "prime numbers"
    end subroutine primes_to
    
end module SimpFunc