program timing_demo
    implicit none
    integer :: i, j, n 
    real :: sum_val
    real :: start_time, end_time

    n = 10000

    call cpu_time(start_time)

    sum_val = 0.0
    
    do i = 1, n
        do j = 1, n 
            sum_val = sum_val + sin(real(i)) + cos(real(j))
        end do
    end do

    call cpu_time(end_time)

    print *, "Result: ", sum_val

    print *, "Time: ", end_time - start_time, "seconds"

end program timing_demo