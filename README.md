# Pardiso matlab mex wrapper

## Compilation
Documentation [source](https://pardiso-project.org/manual/manual.pdf) (Section 5).

Replace 
 ['-L' 'C:\Program Files (x86)\IntelSWTools\parallel_studio_xe_2020.1.086\compilers_and_libraries_2020\windows\compiler\lib\intel64'],...
    '-lifcoremt' 
    
with local fortran compiler location and version. Likewise, replace ['-L' '.\pardiso-libraries'], '-lpardiso'
with location and name of pardiso.lib file.

## Expected Behavior
makepardiso.m should generate mexw64 files and exampleunsym.m should run successfully.

