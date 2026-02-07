program main
    use stdlib_sorting, only: sort
    implicit none
    integer :: arr(5) = [228, 1337, -1, 1987, 85]

    call sort(arr)
    print *, arr

end program main