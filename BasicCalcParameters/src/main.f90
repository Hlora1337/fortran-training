program cli
    implicit none
    
    character(len=256) :: filename
    integer :: num_arguments, io_stat, n, i
    integer :: id
    real :: temp, press
    real :: sum_temp, sum_press
    real :: min_temp, max_temp, min_press, max_press

    num_arguments = command_argument_count()

    if (num_arguments > 1) then
        print *, "Usage: program <filename>"
        stop
    end if

    call get_command_argument(1, filename)
    print *, "Will process file: ", trim(filename)

    open(unit=10, file=trim(filename), status='old', action='read', iostat=io_stat)
    if (io_stat /= 0) then
        print *, "Error opening file"
        stop
    end if

    temp = 0
    press = 0
    sum_temp = 0.0
    sum_press = 0.0
    min_temp = 1e30
    max_temp = -1e30
    min_press = 1e30
    max_press = -1e30

    do
        read(10, *, iostat=io_stat) id, temp, press
        if (io_stat /= 0) exit

        n = n + 1
        sum_temp = sum_temp + temp
        sum_press = sum_press + press

        if (temp < min_temp) min_temp = temp 
        if (temp > max_temp) max_temp = temp 
        if (press < min_press) min_press = press
        if (press > max_press) max_press = press
    end do

    close(10)

    if (n > 0) then
        print *, ""
        print *, "Statistics for", n, "records:"
        print *, ""
        print *, "Temperature:"
        print *, " Average:", sum_temp / n
        print *, " Min:", min_temp
        print *, " Max:", max_temp
        print *, ""
        print *, "Pressure:"
        print *, " Average:", sum_press / n
        print *, " Min:", min_press
        print *, " Max:", max_press
    else 
        print *, "No data found"
    end if

end program cli