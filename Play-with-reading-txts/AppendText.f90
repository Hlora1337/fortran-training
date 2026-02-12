program append_file
    implicit none
    integer :: io_status

    open(unit=12, file='Hi.txt', status='old', position='append', action='write', iostat=io_status)
    
    if ( io_status == 0 ) then
        write(12, *) 'New line is appended'
        close(12)
        print *, 'Data successfully appended'
    else
        print *, "Error in appending"
    end if
end program append_file