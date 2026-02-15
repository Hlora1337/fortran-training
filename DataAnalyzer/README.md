# data analyzer
Console utility for analysis of numeric data from txt files. It reads data, calculates basic metrics and writes them in another txt file

Building through fpm 0.12.0 (at moment of writing)
Statistics written through using stdlib library of Fortran

## What abilities it has?
- Reads file from txt file (One number - one line!)
- Calculates sum, average, min/max
- Sample Variance and Standard Deviation
- Formatted output in terminal and in txt file
- Can hold few errors (File not found/empty file)

## Requirements
- Compiler (I used gcc-gfortran 15.2, other compilers work to I guess?)
- fpm Actual version (Fortran Package Manager) My recommendations version 0.9.0+

## Building and running
    ```bash
    # cloning
    git clone https://github.com/Hlora1337/fortran-training/tree/main/DataAnalyzer
    cd data_analyzer
    # building
    fpm build
    # running
    fpm run -- data/test_data.txt
    ```

## Example of program run
fpm run -- data/data.txt
Project is up to date
Reading: data/data.txt
Loaded 10 values

       STATISTICAL DATA ANALYSIS REPORT       

  Count:              10
  ----------------------------------------------
  Sum:                        175.800000
  Mean:                        17.580000
  Min:                          8.200000
  Max:                         30.100000
  Variance (sample):           50.730667
  Std deviation:                7.122546
  ----------------------------------------------

Results saved to: output.txt

## License: MIT