program HiInTXT
    implicit none
    integer :: io_status

    open(unit=10, file='Hi.txt', status='new', action='write', iostat=io_status)

    if (io_status == 0) then
        write(10, *) 'Hello, Fortran wrote file'
        write(10, *) 'hehe'
        close(10)
        print *, "File written successfully"
    else
        print *, "Error!"
    end if
end program HiInTXT