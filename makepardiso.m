pardisopath = 'C:\Users\jeremy\Desktop\pardiso_intel_compiler_Windows\pardiso-libraries';
matlab_root = 'C:\Program Files\MATLAB\R2020a';

names = {'pardisoinit', 'pardisoreorder', 'pardisofactor', 'pardisosolve', 'pardisofree'};

for i = length(names)
    name = names{i};
    mex('-largeArrayDims', ['-L' 'C:\Program Files\MATLAB\R2020a\extern\lib\win64\microsoft'], '-lmwlapack', '-lmwblas',...
    ['-L' '.\pardiso-libraries'], '-lpardiso',...
    ['-L' 'C:\Program Files (x86)\IntelSWTools\parallel_studio_xe_2020.1.086\compilers_and_libraries_2020\windows\compiler\lib\intel64'],...
    '-lifcoremt', '-liomp5md',...
    'common.cpp', 'matlabmatrix.cpp', 'sparsematrix.cpp', 'pardisoinfo.cpp',...
    [name '.cpp'], '-output', name);
end

