program ArrSum
  implicit none
  integer :: arr1(5), arr2(5)
  integer, allocatable :: arr3(:)

  arr1 = [67, 228, 1337, 1987, -1]
  arr2 = [-456, -23, 87, -101, -76]

  arr1 = arr1 * 2
  arr2 = arr2 * 3

  arr3 = arr1 + arr2

  print *, arr3
  print *, sum(arr3), sum (arr1), sum(arr2)

end program ArrSum
