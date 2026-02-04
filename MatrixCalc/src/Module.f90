module Shit
    implicit none

    contains
    pure function summing(arr1, arr2) result(fullsum)
        integer, intent(in) :: arr1(:, :), arr2(:, :)
        integer :: sum1, sum2, fullsum
        integer :: i, j

        sum1 = 0
        do i = 1, size(arr1, 1)
            do j = 1, size(arr1, 2)
                sum1 = sum1 + arr1(i, j)
            end do
        end do

        sum2 = 0
        do i = 1, size(arr2, 1)
            do j = 1, size(arr2, 2)
                sum2 = sum2 + arr2(i, j)
            end do
        end do

        fullsum = sum1 + sum2
    end function summing


    function multiply(arr1, arr2) result(mult)
        use, intrinsic :: iso_fortran_env, only: int64
        integer, intent(in) :: arr1(:, :), arr2(:, :)
        integer(int64), allocatable :: mult(:,:)

        if (size(arr1, 2) /= size(arr2, 1)) then
            allocate(mult(1,1))
            mult = 0
            return
        end if

        allocate(mult(size(arr1, 1), size(arr2, 2)))
        mult = matmul(arr1, arr2)
    end function multiply

    function diag(arr1, arr2) result(diagsum)
        integer, intent(in) :: arr1(:, :), arr2(:, :)
        integer :: diagsum, i

        diagsum = 0.0

        do i = 1, 10
            diagsum = diagsum + arr1(i, i)
        end do

        do i = 1, 10
            diagsum = diagsum + arr2(i, i)
        end do

    end function diag
    
end module Shit