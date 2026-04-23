module io
    use iso_fortran_env, only: real64
    use particle_mod, only: particle
    implicit none
    private
    public :: write_particles
    
contains
    subroutine write_particles(step, particles)
        integer, intent(in) :: step
        type(particle), intent(in) :: particles(:)

        integer :: unit
        integer :: i
        character(len=64) :: filename

        write(filename, '("particles_",I5.5,".dat")') step

        open(newunit=unit, file=filename, status="replace", action="write")

        do i = 1, size(particles)
            write(unit, '(F12.6, 1X, F12.6)') particles(i)%x, particles(i)%y
        end do 

    end subroutine

end module io