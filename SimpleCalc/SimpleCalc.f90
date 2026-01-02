program SimpleCalc
  implicit none
  real :: numbers (5)
  character(len = 1) :: operators (4)
  integer :: n, o, amount
  real :: calculation
  character (len = :), allocatable :: answer

  allocate (character (len = 10) :: answer)

  do n = 1, 5
    print *, 'Enter a number'
    read (*,*) numbers(n)
    if (n < 5) then
      print *, 'Enter an operator (+, -, *, /)'
      read (*,'(A1)') operators(n)
    end if
  end do

  do
    print *, "Tell what to do (print help for, well, help)"
    read (*,*) answer

    select case (answer)
    case ('help')
      print *, 'List of all commands'
      print *, 'calc - calculate everything how you want it'
      print *, 'stop - kills the program'
      print *, 'version - prints version of the calculator'
      print *, 'Sorry that program is very limited, still alpha version after all'
    case ('calc')
      print *, 'How many numbers you want to calc (2-5)'
      read (*,*) amount
      calculation = numbers(1)
      do n = 1, amount - 1
        select case (operators(n))
        case ('+')
          calculation = calculation + numbers(n+1)
        case ('-')
          calculation = calculation - numbers(n+1)
        case ('*')
          calculation = calculation * numbers(n+1)
        case ('/')
          calculation = calculation / numbers(n+1)
        end select
      end do

      write (*, '(A)', advance='no') 'Expression: '
      write(*, '(A, F0.6)', advance='no') ' ', numbers(1)
      do n = 1, amount - 1
        write(*, '(A, A, F0.6)', advance='no') ' ', operators(n), numbers(n+1)
      end do
      print *
      print *, 'Calculation: ', calculation
    case ('version')
      print *, 'Version is 0.0.3'
    case ('stop')
      stop
    end select
  end do

end program SimpleCalc
