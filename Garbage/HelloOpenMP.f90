program hello
    use omp_lib
    implicit none
    integer :: thread_id, num_threads

    !$omp parallel private(thread_id)
        thread_id = omp_get_thread_num()
        num_threads = omp_get_num_threads()
        print *, "Hello from thread", thread_id, "of", num_threads
    !$omp end parallel
    
end program hello