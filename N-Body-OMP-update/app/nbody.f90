program nbody
    use iso_fortran_env, only: real64
    use particle_mod
    use simulation
    use io
    use omp_lib
    implicit none

    type(particle), allocatable :: particles(:)

    integer :: n_particles
    integer :: nsteps
    integer :: output_interval

    real(real64) :: dt
    real(real64) :: box_min, box_max
    real(real64) :: vmax

    ! параметры симуляции
    n_particles = 1000
    nsteps = 1000
    output_interval = 10

    dt = 0.01_real64
    box_min = 0.0_real64
    box_max = 100.0_real64
    vmax = 1.0_real64

    print *, "Starting simulation"
    print *, "Particles:", n_particles
    print *, "Steps:", nsteps

    call init_particles(particles, n_particles, box_min, box_max, vmax)

    call run_simulation( &
        particles, &
        nsteps, &
        dt, &
        box_min, &
        box_max, &
        output_interval, &
        write_particles &
    )

    print *, "Simulation finished"

end program nbody
