with Ada.Text_IO;
use Ada.Text_IO;

package body t_array is
   function split(arr: T_Arr; size: T_Index) return T_Matrix is 
      Size_1: T_Index := arr'Last / size;
      Mx: T_Matrix(1..Size_1, 1..size); 
      Counter: T_Index := arr'First; 
   begin
      for i in Mx'First..Mx'Last loop
         declare
            temp: T_Index := Counter + size;
            ind: T_Index := Mx'First(2);
         begin
            for j in Counter..temp-1 loop
               Mx(i, ind) := arr(j);
               ind := ind + 1;
            end loop;
            Counter := temp;
         end;
      end loop;
      return Mx;
   end split;
   
   
   procedure print_matrix(mx: T_Matrix) is 
   begin 
      for i in mx'Range(1) loop
         Put("Row: ");
         for j in mx'Range(2) loop
            Put(mx(i, j)'Image & ", ");
         end loop;
         New_Line;
      end loop;
   end print_matrix;
   
end t_array;
