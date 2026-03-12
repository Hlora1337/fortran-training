program DerPar
    implicit none
    type :: Particle
    real :: x, y
    real :: mass
    end type Particle
    
    integer :: i
    type(Particle) :: array(10)

    array(1)%x = 0.1
    array(1)%y = -0.2
    array(1)%mass = 1.1

    array(2)%x = 0.5
    array(2)%y = 0.3
    array(2)%mass = 1.5

    array(3)%x = -0.4
    array(3)%y = 0.6
    array(3)%mass = 0.9

    array(4)%x = 0.8
    array(4)%y = -0.5
    array(4)%mass = 2.0

    array(5)%x = -0.3
    array(5)%y = 0.2
    array(5)%mass = 1.2

    array(6)%x = 0.7
    array(6)%y = 0.1
    array(6)%mass = 1.8

    array(7)%x = -0.6
    array(7)%y = -0.4
    array(7)%mass = 0.8

    array(8)%x = 0.2
    array(8)%y = 0.9
    array(8)%mass = 1.3

    array(9)%x = -0.1
    array(9)%y = -0.7
    array(9)%mass = 1.6

    array(10)%x = 0.4
    array(10)%y = 0.5
    array(10)%mass = 1.4

    do i = 1, 10
        print *, array(i)
    end do

end program DerPar
