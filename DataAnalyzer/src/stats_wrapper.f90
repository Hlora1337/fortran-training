module stats_wrapper
    use iso_fortran_env, only: dp => real64
    use stdlib_stats, only: mean, var
    implicit none

    private
    type, public :: stats_result
        integer  :: count    = 0
        real(dp) :: sum_value  = 0.0_dp
        real(dp) :: mean_value = 0.0_dp
        real(dp) :: min_value  = 0.0_dp
        real(dp) :: max_value  = 0.0_dp
        real(dp) :: var_value  = 0.0_dp
        real(dp) :: std_value  = 0.0_dp
    end type stats_result
    public :: compute_stats

contains
    function compute_stats(data) result(res)
        real(dp), intent(in) :: data(:)
        type(stats_result) :: res
        integer :: n

        n = size(data)
        res%count = n

        if (n == 0) return
            res%sum_value  = sum(data)
            res%mean_value = mean(data)
            res%min_value  = minval(data)
            res%max_value  = maxval(data)
        if (n > 1) then
            res%var_value = var(data)
            res%std_value = sqrt(res%var_value)
        end if

    end function compute_stats

end module stats_wrapper