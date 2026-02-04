program TestProgram
    use Shit
    implicit none

    ! Variable declarations
    integer :: result, a, b, c
    integer :: factorial_result
    integer :: i
    logical :: is_number_even
    integer, dimension(10) :: my_array
    integer, dimension(10, 10) :: matrix

    print *, "Square function demonstration:"
    result = square(5)

    print *, "Cube function demonstration:"
    result = cube(3)

    print *, "Max value function demonstration:"
    a = 10
    b = 20
    c = 15
    result = max_value(a, b, c)

    print *, "Factorial function demonstration:"
    factorial_result = factor(5)

    print *, "Is even function demonstration:"
    is_number_even = is_even(6)
    is_number_even = is_even(7)

    print *, "Swap subroutine demonstration:"
    a = 5
    b = 10
    print *, "Before swap: a =", a, "b =", b
    call swap(a, b)
    print *, "After swap: a =", a, "b =", b

    print *, "Fill Array subroutine demonstration:"
    call fill_Array(matrix, 0)

    print *, "Print Array subroutine demonstration:"
    do i = 1, 10
        my_array(i) = i * 2
    end do
    call print_array(my_array)

    print *, "Reverse Array subroutine demonstration:"
    call print_array(my_array)
    call reverse_array(my_array)
    print *, "After reversal:"
    call print_array(my_array)

    print *, "Sort Array subroutine demonstration:"
    do i = 1, 10
        my_array(i) = 10 - i + 1
    end do
    print *, "Before sorting:"
    call print_array(my_array)
    call sort_array(my_array)
    print *, "After sorting:"
    call print_array(my_array)

end program TestProgram
