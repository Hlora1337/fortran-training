program MM
  implicit none
  integer, dimension(2,5) :: matrix1
  integer, dimension(2,5) :: matrix2
  integer, dimension(2,2) :: matrix3
  integer :: array(10)
  integer :: i, j

  array = [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]

  print *, "Fill the matrix (10 integers)"
  read (*,*) ((matrix1(i,j), j=1,5), i=1,2)

  matrix2 = reshape(array, [2, 5])

  print *, "Original matrix2:"
  print *, matrix2

  matrix2 = matrix2 * 3

  print *, "First matrix (matrix1):"
  print *, matrix1
  print *, "Scaled matrix2:"
  print *, matrix2

  matrix3 = matmul(matrix1, transpose(matrix2))

  print *, "Result of matrix multiplication (matrix3):"
  print *, matrix3

  print *, "Max value of matrix1 first row is: ", maxval(matrix1(1, :))
  print *, "Max value of matrix1 second row is: ", maxval(matrix1(2, :))

end program MM

