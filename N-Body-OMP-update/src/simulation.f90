module simulation
    use iso_fortran_env, only: real64
    use particle_mod
    use omp_lib
    implicit none
    private
    public :: init_particles, step_simulation, run_simulation, calculate_forces
    
contains

    subroutine init_particles(particles, n, box_min, box_max, vmax)
        type(particle), allocatable, intent(out) :: particles(:)
        integer, intent(in) :: n
        real(real64), intent(in) :: box_min, box_max
        real(real64), intent(in) :: vmax

        integer :: i

        allocate(particles(n))

        !$omp parallel do
            do i = 1, n
                call init_particle(particles(i), box_min, box_max, vmax)
            end do
        !$omp end parallel do

    end subroutine init_particles

    subroutine calculate_forces(particles)
        type(particle), intent(inout) :: particles(:)

        real(real64), parameter :: G = 1.0_real64
        real(real64), parameter :: eps = 0.01_real64

        integer :: i, j
        real(real64) :: dx, dy, r, r2, F, fx_comp, fy_comp

        !$omp parallel do default(none) shared(particles) private(i, j, dx, dy, r, r2, F, fx_comp, fy_comp)

            do i = 1, size(particles)
                particles(i)%fx = 0.0_real64
                particles(i)%fy = 0.0_real64
                do j = 1, size(particles)
                    if (i == j) cycle
                    dx = particles(j)%x - particles(i)%x
                    dy = particles(j)%y - particles(i)%y
                    r2 = dx*dx + dy*dy + eps*eps
                    r = sqrt(r2)
                    F = G * particles(i)%mass * particles(j)%mass / r2
                    fx_comp = F * dx / r
                    fy_comp = F * dy / r
                    particles(i)%fx = particles(i)%fx + fx_comp
                    particles(i)%fy = particles(i)%fy + fy_comp
                end do
            end do
        !$omp end parallel do
    
    end subroutine calculate_forces
    
    subroutine step_simulation(particles, dt, box_min, box_max)
        type(particle), intent(inout) :: particles(:)
        real(real64), intent(in) :: dt 
        real(real64), intent(in) :: box_min, box_max

        call calculate_forces(particles)

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
