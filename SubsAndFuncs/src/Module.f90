module Shit
    implicit none

    contains
    pure function square(n) result(x)
        integer, intent(in) :: n
        integer :: x
        x = n * n 
    end function square

    pure function cube(n) result(y)
        integer, intent(in) :: n 
        integer :: y
        y = n * n * n 
    end function cube

    pure function max_value(a, b, c) result(maximum)
        integer, intent(in) :: a, b, c 
        integer :: maximum
        
        maximum = max(a, b, c)
    end function max_value

    function factor(n) result(fuc)
        integer, intent(in) :: n
        integer :: fuc
        integer :: i 

        fuc = 1
        do i = 1, n
            fuc = fuc * i 
        end do  
    end function factor

    pure function is_even(n) result(even)
        integer, intent(in) :: n
        logical :: even
        even = (mod(n, 2) == 0)
    end function is_even

    subroutine swap(a, b)
        integer, intent(inout) :: a, b
        integer :: temp

        temp = a
        a = b
        b = temp
    end subroutine swap

    subroutine fill_Array(arr, value)
        integer, intent(inout) :: arr(:,:)
        integer, intent(in) :: value
        integer :: i, j

        do i = 1, size(arr, 1)
            do j = 1, size(arr, 2)
                arr(i, j) = value
            end do
        end do
    end subroutine fill_Array

    subroutine print_array(arr)
        implicit none
        integer, intent(in) :: arr(:)
        integer :: i
    
        do i = 1, size(arr)
            print *, arr(i)
        end do
    end subroutine print_array

    subroutine reverse_array(arr)
        implicit none
        integer, intent(inout) :: arr(:)
        integer :: temp
        integer :: i, n
    
        n = size(arr)
        do i = 1, n/2
            temp = arr(i)
            arr(i) = arr(n - i + 1)
            arr(n - i + 1) = temp
        end do
    end subroutine reverse_array

    subroutine sort_array(arr)
        implicit none
        integer, intent(inout) :: arr(:)
        integer :: i, j, n, temp
        logical :: swapped
    
        n = size(arr)
        do i = 1, n-1
            swapped = .false.
            do j = 1, n-i
                if (arr(j) > arr(j+1)) then
                    temp = arr(j)
                    arr(j) = arr(j+1)
                    arr(j+1) = temp
                    swapped = .true.
                end if
            end do
            
            if (.not. swapped) exit
        end do
    end subroutine sort_array

end module Shit
