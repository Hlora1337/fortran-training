program test_omp
    use omp_lib
    implicit none
    integer :: i, j, n 
    real :: sum_val
    real :: start_time, end_time
    integer :: num_threads

    n = 10000
    sum_val = 0.0

    start_time = omp_get_wtime()

    !$omp parallel private(i, j) reduction(+:sum_val) num_threads(num_threads)
        !$omp do collapse(2) schedule(static)
        do i = 1, n
            do j = 1, n 
                sum_val = sum_val + sin(real(i)) + cos(real(j))
            end do
        end do
        !$omp end do
    !$omp end parallel

    end_time = omp_get_wtime()

    print *, "Result: ", sum_val
    print *, "Used threads: ", num_threads
    print *, "Time: ", end_time - start_time, "seconds"

end program
