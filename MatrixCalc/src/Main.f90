program main
    use Shit
    use, intrinsic :: iso_fortran_env, only: int64
    implicit none
    
    integer :: arr1(10, 10)
    integer :: arr2(10, 10)
    integer :: sumfunc, diagsum
    integer(int64), allocatable :: mult(:, :)
    real :: random_num
    integer :: i, j

    call random_seed()
    
    do i = 1, 10
        do j = 1, 10
            call random_number(random_num)
            arr1(i, j) = int(random_num * 1000) + 1
        end do
    end do

    do i = 1, 10
        do j = 1, 10
            call random_number(random_num)
            arr2(i, j) = int(random_num * 1000) + 1
        end do
    end do

    sumfunc = summing(arr1, arr2)
    print *, sumfunc

    mult = multiply(arr1, arr2)
    do i = 1, size(mult, 1)
        print *, mult(i, :)
    end do

    diagsum = diag(arr1, arr2)
    print *, "Diagsum = ", diagsum
    
end program main
