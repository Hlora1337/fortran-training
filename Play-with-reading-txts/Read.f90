program reading
    implicit none
    integer :: io_status
    character(len=100) :: line

    open(unit=11, file='Hi.txt', status='old', action='read', iostat=io_status)

    if (io_status == 0) then
        do 
            read(11, '(A)', iostat=io_status) line
            if (io_status /= 0) exit
            print *, trim(line)
        end do
        close(11)
    else
        print *, "Error opening file -_-"
    end if

end program reading