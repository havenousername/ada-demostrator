procedure tasks is
   -- Let's implement some simple algorithms with ADA arrays


   -- First:
   -- 0. Make a type for the array of integers 
   -- 1. Initialize the array with values: -56, -23, 454, -23, -56
   -- 2. Write for loop for the array (use 'Range attribute)
   -- 3. Find first value is greater than, exit the loop (find better solution??), assign it to the resulting value
   -- 4. Modify array type such that indexes should be characters 
   -- 5. Modify the procedure in the way that instead it prints index of the value
   
   -- Second:
   -- 1. Create a random_int procedure, which generates random integer, use Ada.Numerics.Discrete_Random
   -- Concept of packages + plus introduction to generics (small intro)
   -- https://craftofcoding.wordpress.com/2020/02/14/coding-ada-random-numbers/ 
   -- 2. In second procedure generate an array, of the size sent from the argument list,
   -- Array should have its own type and it's range should be *indefinite*. Generate array with aggregating syntax (others)
   -- 3. Fill the array values with random integers in the for loop
   -- 4. Find the sum of elements and output it to the console
   
   
   -- Third
   -- Create a package with a split function which accepts as parameters array of integers
   -- (defined in the package as well)
   -- and the size of the cut
   -- and returns a matrix with splitted values
   -- print this matrix in the end as well
begin
   null;
end tasks;
