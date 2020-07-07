# Pardiso matlab mex wrapper

## Compilation
Documentation [source](https://pardiso-project.org/manual/manual.pdf) (Section 5).

Replace 
 ['-L' fortranpath],...
    '-l...' 
    
with local fortran compiler location and version. Likewise, replace ['-L' pardisopath], '-lpardiso'
with location and name of libpardiso600-WIN-X86-64.lib file. (It helps if you rename it to pardiso.lib beforehand)

## Expected Behavior
makepardiso.m should generate mexw64 files and exampleunsym.m should run successfully.

