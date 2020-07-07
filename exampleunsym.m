% This is an example script demonstrating how PARDISO works on a small,
% sparse, real non-symmetric matrix. It computes the m solutions X to the
% collection of linear systems
%
%    A * X = B
%
% using the PARDISO solver, where A is a symmetric n x n matrix, B is an
% n x m matrix, and X is another n x m matrix.
clear
verbose = false;

n = 4;  % The number of equations.
m = 1;  % The number of right-hand sides.

A = sparse([  0 -2  3 0
             -2  4 -4 1
             -3  5  1 1
              1 -3  0 2 ]);

% Generate a random collection of right-hand sides.
b1 = ones(n,m);

% Initialize the PARDISO internal data structures. We've told PARDISO to
% handle real non-symmetric matrices using the sparse direct solver.
info = pardisoinit(11,0);

% Analyze the matrix and compute a symbolic factorization.
info = pardisoreorder(A,info,verbose); % phase 11
fprintf('The factors have %d nonzero entries.\n',info.iparm(18));

% Compute the numeric factorization.
info = pardisofactor(A,info,verbose); % phase 22

% Compute the solutions X using the symbolic factorization.
[X info] = pardisosolve(A,b1,info,verbose); % phase 33
fprintf('PARDISO performed %d iterative refinement steps.\n',info.iparm(7));

% Compute the residuals.
R = max(abs(A*X - b1));
fprintf('The maximum residual for the solution X is %0.3g.\n',max(R(:)));

% Run pardisosolve again and reuse factorizations
b2 = linspace(1,n,n);
[X info] = pardisosolve(A,b2,info,verbose); % phase 33

% Free the PARDISO data structures.
pardisofree(info);
clear info
