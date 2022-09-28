with Ada.Text_IO;
with Ada.Numerics.Discrete_Random;
with t_array;
use Ada.Text_IO;

procedure Main is
   -- Let's implement some simple algorithms with ADA arrays


   -- First:
   -- 0. Make a type for the array of integers
   -- 1. Initialize the array with values: -56, -23, 454, -23, -56
   -- 2. Write for loop for the array (use 'Range attribute)
   -- 3. Find first value is greater than, exit the loop (find better solution??), assign it to the resulting value
   -- 4. Modify array type such that indexes should be characters
   -- 5. Modify the procedure in the way that instead it prints index of the value

   procedure find_bigger_zero is
      type ArrSixthSize is array(Character range 'A'..'E') of Integer;
      Container: ArrSixthSize := (-56, -23, 454, -23, -56);
      Result: Integer := -1;
      Index: Character;
   begin
      for i in Container'Range loop
         if Container(i) > 0 then
            Result := Container(i);
            Index := i;
            exit;
         end if;
      end loop;
      -- Put_Line(Result'Image);
      Put_Line(Index'Image);
   end find_bigger_zero;

   -- Second:
   -- 1. Create a random_int procedure, which generates random integer, use Ada.Numerics.Discrete_Random
   -- Concept of packages + plus introduction to generics (small intro)
   -- https://craftofcoding.wordpress.com/2020/02/14/coding-ada-random-numbers/
   -- 2. In second procedure generate an array, of the size sent from the argument list,
   -- Array should have its own type and it's range should be *indefinite*. Generate array with aggregating syntax (others)
   -- 3. Fill the array values with random integers in the for loop
   -- 4. Find the sum of elements and output it to the console

   procedure random_int(output: out Integer) is
      subtype RandRange is Integer range 1..100;
      package Rand_Int is new Ada.Numerics.Discrete_Random(RandRange);
      use Rand_Int;
      gen: Generator;
      Num: RandRange;
   begin
      Reset(gen);
      Num := Random(gen);
      output := Num;
   end random_int;

   procedure sum_rand_array(size: in Integer) is
      type ArrayLocal is array(Integer range <>) of Integer;
      Container: ArrayLocal(1..size) := (others => 0);
      Sum: Natural := 0;
   begin
      for El of Container loop
         random_int(El);
      end loop;

      for El of Container loop
         Sum := Sum + El;
      end loop;

      Put_Line(Sum'Image);
   end sum_rand_array;


   -- Third
   -- Create a package with a split function which accepts as parameters array of integers
   -- (defined in the package as well)
   -- and the size of the cut
   -- and returns a matrix with splitted values
   -- print this matrix in the end as well

   arr: t_array.T_Arr(1..6) := (1, 2, 3, 4, 5, 6);
   cut: t_array.T_Index := 2;
   matrix: t_array.T_Matrix(1..3, 1..2);

begin
   find_bigger_zero;
   sum_rand_array(6);
   matrix := t_array.split(arr, cut);
   t_array.print_matrix(matrix);
end Main;
