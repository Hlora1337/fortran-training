program write_in_file
    implicit none
    integer :: io_unit, i 
    real :: x, y

    open(newunit=io_unit, file='Shit.txt', status='replace')

    do i = 1, 100
        x = real(i) * 0.1
        y = sin(x)
        write(io_unit, '(F6.2, 2X, F8.5)') x, y
    end do

    close(io_unit)
    print *, "Data is changed"
end program write_in_file