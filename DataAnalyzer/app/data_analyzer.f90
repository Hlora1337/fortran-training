program data_analyzer
    use iso_fortran_env, only: dp => real64, output_unit, error_unit
    use stats_wrapper, only: stats_result, compute_stats
    use file_io, only: read_data_from_file, print_report
    implicit none
    character(len=256) :: input_filename
    character(len=256) :: output_filename
    real(dp), allocatable :: data(:)
    logical :: success
    type(stats_result) :: res
    integer :: out_unit, iostat
    output_filename = 'output.txt'

    if(command_argument_count() < 1) then
        write(error_unit, '(A)') 'Usage: data_analyzer <input_file>'
        write(error_unit, '(A)') 'Example: data_analyzer data/test_data.txt'
        stop 1
    end if
    call get_command_argument(1, input_filename)

    write(output_unit, '(2A)') 'Reading: ', trim(input_filename)
    call read_data_from_file(input_filename, data, success)
    if(.not. success) then
        write(error_unit, '(A)') "Error: Can't read file. Exiting"
        stop 1
    end if

    write(output_unit, '(A,I0,A)') 'Loaded ', size(data), ' values'
    res = compute_stats(data)

    call print_report(output_unit, res)
    open(newunit=out_unit, file=output_filename, status='replace', &
        action='write', iostat=iostat)
    if(iostat /= 0) then
        write(error_unit, '(A)') 'Error: Cannot create ' // trim(output_filename)
        stop 1
    end if 
    
    call print_report(out_unit, res)
    close(out_unit)
    write(output_unit, '(2A)') 'Results saved to: ', trim(output_filename)
    deallocate(data)
    
end program data_analyzer