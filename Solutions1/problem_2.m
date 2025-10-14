% 1. create a small 1D array (e.g. a vector), named A, containing the numbers 0, 2, 5, 8, 9
A = [0 2 5 8 9];
% 2. replace the fourth value of A with the number 1
A(4) = 1;
% 3. subtract 1 to each element of A, and store the result in X
X = A-1;
% 4. add all the values of A using the sum command, and store in s
s = sum(A);
% 5. multiply each element of A by itself (i.e. element-wise multiplication), store in B
B = A.*A;
% 6. take the transpose of A, store in At
At = A';
% 7. use the find command to find the index of element of A equal to 5, store the result in id5.
id5 = find(A==5);
% 8. find the indices of all element of A greater than 3, store the results in idAbove3
idAbove3 = find(A>3);
% 9. replace all element of A greater than 3, with the number 66, store in A66
A66 = A; A66(idAbove3) = 66;
% 10. find the indices of all element of A which are not equal to 2, store in idNot2 
idNot2 = find(A~=2);