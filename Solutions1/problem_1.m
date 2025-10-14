% 1. store the value 6 in a variable x
x = 6;
% 2. add two to x, store the results in the variable y
y = x+2;
% 3. multiply y by 2 and subtract half of x to it, store the results in z
z = y*2 - x/2;
% 4. use the `==` operator to check z is equal to 13
z == 13 
% 5. learn how to use the `sqrt` command: type `help sqrt` into the command window
help sqrt
% 6. store the value 16 in the variable $$t$$.
t=16;   
% 7. evaluate the remainder of t divided by 3 using the rem command (use `help`)
rem(t,3)     
% 8. use the `sqrt` command to calculate the square root of t and store it in $$x$$
x = sqrt(t);   
% 9. calculate the square of x using the `ˆ` operator, store the results in t2
t2 = x^2;     
% 10. use the `==` operator to check t2 is equal to t
t2 == t         

% 11. set `t=10` and repeat steps 8-10.
t = 10;
x = sqrt(t);
t2 = x^2;
t2 == t

% Bonus evalute using a tolerance
abs(t-t2)<=eps(t)