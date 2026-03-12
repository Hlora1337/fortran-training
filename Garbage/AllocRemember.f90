program alloc
    implicit none
    integer, allocatable :: array(:)
    integer :: n, i, sum
    real :: random_num

    sum = 0

    print *, "Enter the size"
    read (*,*) n 

    allocate(array(n))
    call random_seed()

    do i = 1, n 
        call random_number(random_num)
        array(i) = int(random_num * 100) + 1
    end do

    do i = 1, n 
        sum = sum + array(i)
    end do

    print *, sum

end program alloc