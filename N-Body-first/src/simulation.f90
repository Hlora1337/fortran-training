module simulation
    use iso_fortran_env, only: real64
    use particle_mod
    implicit none
    private
    public :: init_particles, step_simulation, run_simulation
    
contains

    subroutine init_particles(particles, n, box_min, box_max, vmax)
        type(particle), allocatable, intent(out) :: particles(:)
        integer, intent(in) :: n
        real(real64), intent(in) :: box_min, box_max
        real(real64), intent(in) :: vmax

        integer :: i

        allocate(particles(n))

        do i = 1, n
            call init_particle(particles(i), box_min, box_max, vmax)
        end do

    end subroutine init_particles

    subroutine step_simulation(particles, dt, box_min, box_max)
        type(particle), intent(inout) :: particles(:)
        real(real64), intent(in) :: dt 
        real(real64), intent(in) :: box_min, box_max

        call move_particle(particles, dt)
        call reflect_particle(particles, box_min, box_max)

    end subroutine step_simulation

    subroutine run_simulation(particles, nsteps, dt, box_min, box_max, output_interval, write_output)
        type(particle), intent(inout) :: particles(:)
        integer, intent(in) :: nsteps
        integer, intent(in) :: output_interval
        real(real64), intent(in) :: dt
        real(real64), intent(in) :: box_min, box_max

        interface
            subroutine write_output(step, particles)
                import particle
                integer, intent(in) :: step
                type(particle), intent(in) :: particles(:)
            end subroutine
        end interface

        integer :: step

        do step = 1, nsteps

            call step_simulation(particles, dt, box_min, box_max)

            if (mod(step, output_interval) == 0) then
                call write_output(step, particles)
            end if

        end do

    end subroutine run_simulation
    
end module simulation