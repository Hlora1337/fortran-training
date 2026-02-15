module file_io
    use iso_fortran_env, only: dp => real64, error_unit
    use stats_wrapper, only: stats_result
    implicit none
    
    private
    public :: read_data_from_file, print_report

contains
    subroutine read_data_from_file(filename, data, success)
        character(len=*), intent(in) :: filename
        real(dp), allocatable, intent(out) :: data(:)
        logical, intent(out) :: success
        real(dp), allocatable :: buffer(:)
        real(dp) :: temp
        integer :: unit, iostat, n, capacity

        success = .false.

        open(newunit=unit, file=filename, status='old', action='read', iostat=iostat)
        
        if (iostat /= 0) then
            write(error_unit, '(A)') "Error, can't open file or it's not existing" // trim(filename)
            return
        end if

        capacity = 64
        allocate(buffer(capacity))
        n = 0
        do 
            read(unit, *, iostat=iostat) temp
            if(iostat /= 0) exit 
            n = n + 1
            if (n > capacity) then
                capacity = capacity * 2
                buffer = [buffer, buffer]
            end if
            buffer(n) = temp
        end do
        close(unit)

        if (n == 0) then
            write(error_unit, '(A)') 'Error: File is empty or lacking numbers'
            deallocate(buffer)
            return
        end if

        data = buffer(1:n)
        deallocate(buffer)
        success = .true.
    end subroutine read_data_from_file

    subroutine print_report(unit, res)
        integer, intent(in) :: unit
        type(stats_result), intent(in) :: res
        character(len=*), parameter :: line = repeat('-', 46)
        character(len=*), parameter :: fmt_r = '(A,F18.6)'
        character(len=*), parameter :: fmt_i = '(A,I0)'
        
        write(unit, '(A)') ''
        write(unit, '(A)') '       STATISTICAL DATA ANALYSIS REPORT       '
        write(unit, '(A)') ''
        write(unit, fmt_i) '  Count:              ', res%count
        write(unit, '(A)') '  ' // line
        write(unit, fmt_r) '  Sum:                ', res%sum_value
        write(unit, fmt_r) '  Mean:               ', res%mean_value
        write(unit, fmt_r) '  Min:                ', res%min_value
        write(unit, fmt_r) '  Max:                ', res%max_value
        write(unit, fmt_r) '  Variance (sample):  ', res%var_value
        write(unit, fmt_r) '  Std deviation:      ', res%std_value
        write(unit, '(A)') '  ' // line
        write(unit, '(A)') ''
    end subroutine print_report
end module file_io
