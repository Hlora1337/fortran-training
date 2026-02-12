program reading_table
    implicit none
    integer :: io_unit, ios, day
    real :: temp, pressure
    real :: sum_temp, sum_press
    integer :: count

    count = 0
    sum_temp = 0.0
    sum_press = 0.0

    open(newunit=io_unit, file='Measurements.txt', status='old')

    do 
       read(io_unit, *, iostat=ios) day, temp, pressure
       if (ios /= 0) exit
       
       sum_temp = sum_temp + temp
       sum_press = sum_press + pressure
       count = count + 1

       print '(A, I2, A, F5.1, A, F6.1)', &
        "Day ", day, " T = ", temp, " P = ", pressure
    end do

    close(io_unit)

    print *
    print '(A, F5.1)', "Average temperature: ", sum_temp / count
    print '(A, F6.1)', "Average pressure: ", sum_press / count
end program reading_table