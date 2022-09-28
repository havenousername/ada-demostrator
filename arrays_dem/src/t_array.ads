package t_array is
   type T_Index is new Integer;
   type T_Elem is new Integer;
   
   type T_Arr is array(T_Index range <>) of T_Elem;
   type T_Matrix is array (T_Index range <>, T_Index range <>) of T_Elem;
   
   function split(arr: T_Arr; size: T_Index) return T_Matrix;
   procedure print_matrix(mx: T_Matrix);
end t_array;
