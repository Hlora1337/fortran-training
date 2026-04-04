program ParSum
    use omp_lib
    use iso_fortran_env, only: real64
    implicit none
    integer, parameter :: n = 100000000
    real(real64), allocatable :: arr(:)
    real(real64) :: total
    real :: start_time, end_time
    integer :: i 

    allocate(arr(n))

    do i = 1, n 
        arr(i) = 1.0/real(i)
    end do 

    !This shit is for normal count

    start_time = omp_get_wtime()
    total = 0.0

    do i = 1, n
        total = total + arr(i)
    end do

    end_time = omp_get_wtime()

    print *, "Sequential: ", total, "Time: ", end_time - start_time


    !This shit though is for OpenMP

    start_time = omp_get_wtime()

    total = 0.0 

    !$omp parallel do reduction(+:total)
    do i = 1, n 
        total = total + arr(i)
    end do 
    !$omp end parallel do

    end_time = omp_get_wtime()

    print *, "Parallel: ", total, "Time: ", end_time - start_time

end program