program read_file
    implicit none
    integer :: io_unit, value, total, ios

    total = 0
    open(newunit=io_unit, file='File.txt', status='old', iostat=ios)

    if (ios /= 0) then
        print *, "Error opening file!"
        stop
    end if
    
    do 
        read(io_unit, *, iostat=ios) value
        if (ios /= 0) exit
        total = total + value 
    end do

    close(io_unit)
    print *, "Sum: ", total
end program read_file 