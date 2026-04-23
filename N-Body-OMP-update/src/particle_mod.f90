module particle_mod
    use iso_fortran_env, only: real64
    implicit none 
    private
    public :: particle, init_particle, move_particle, reflect_particle
    type :: particle
        real(real64) :: x, y
        real(real64) :: vx, vy
        real(real64) :: mass
        real(real64) :: fx, fy
    end type particle

contains

    subroutine init_particle(p, box_min, box_max, vmax)
        type(particle), intent(inout) :: p
        real(real64), intent(in) :: box_min, box_max
        real(real64), intent(in) :: vmax

        real(real64) :: r(5)

        call random_number(r)
        p%mass = 0.5_real64 + r(5) * 0.5_real64

        p%x = box_min + (box_max - box_min) * r(1)
        p%y = box_min + (box_max - box_min) * r(2)

        p%vx = (2.0_real64 * r(3) - 1.0_real64) * vmax
        p%vy = (2.0_real64 * r(4) - 1.0_real64) * vmax

    end subroutine init_particle

    pure elemental subroutine move_particle(p, dt)
        type(particle), intent(inout) :: p
        real(real64), intent(in) :: dt

        ! Update velocity based on force (a = F/m)
        p%vx = p%vx + (p%fx / p%mass) * dt
        p%vy = p%vy + (p%fy / p%mass) * dt

        ! Update position based on velocity
        p%x = p%x + p%vx * dt
        p%y = p%y + p%vy * dt

    end subroutine move_particle

    pure elemental subroutine reflect_particle(p, box_min, box_max)
        type(particle), intent(inout) :: p
        real(real64), intent(in) :: box_min, box_max

        if (p%x < box_min) then
            p%x = box_min
            p%vx = -p%vx
        else if (p%x > box_max) then
            p%x = box_max
            p%vx = -p%vx
        end if

        if (p%y < box_min) then
            p%y = box_min
            p%vy = -p%vy
        else if (p%y > box_max) then
            p%y = box_max
            p%vy = -p%vy
        end if

    end subroutine reflect_particle

end module particle_mod
