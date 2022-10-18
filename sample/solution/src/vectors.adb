with Ada.Text_IO;
use Ada.Text_IO;

package body Vectors is
   procedure Insert_Dimension(V: in out Vector; Name: Index; Value: Elem) is
   begin 
      if V.Pointer > V.D then 
           return;
      end if;
      
      V.Pointer := Natural'Succ(V.Pointer);
      V.Names(V.Pointer) := Name;
      V.Values(V.Pointer) := Value;
   end Insert_Dimension;
   
   function Dimensions(V: in Vector) return Dimension is 
   begin 
      return V.D;
   end Dimensions;
   
   function Get(V: in Vector; Name: Index) return Get_Return is
      Getter: Get_Return;
   begin 
      for I in Positive'First..V.Pointer loop
         if V.Names(I) = Name then
            Getter.Getter := V.Values(I);
            Getter.Exists := True;
            exit;
         end if;
      end loop;
      
      return Getter;
   end Get;
   
   function Has_Dimension_Name(V: in Vector; Name: Index) return Boolean is
   begin 
       for I in Positive'First..V.Pointer loop
         if V.Names(I) = Name then
           return True;
         end if;
      end loop;
      
      return False;
   end Has_Dimension_Name;
   
   
   function Get_First(V: in Vector) return Get_Return is 
      Getter: Get_Return;
   begin 
      if V.Pointer /= 0 then
         Getter.Getter := V.Values(Dimension'First);
         Getter.Exists := True;
      end if;
      
      return Getter;
   end Get_First;
   
   function Get_Last(V: in Vector) return Get_Return is 
      Getter: Get_Return;
   begin 
      if V.Pointer /= Dimension'Last then
         Getter.Getter := V.Values(Dimension'Last);
         Getter.Exists := True;
      end if;
      
      return Getter;
   end Get_Last;
   
   
   
   function "+"(V1, V2: in Vector) return Vector is
      V3: Vector := V1;
      Last: Natural := V1.Pointer;
   begin 
      V3.Pointer := Natural'First;
      for I in Positive'First..Last loop
         if Has_Dimension_Name(V2, V3.Names(I)) then 
            Insert_Dimension(V3, V3.Names(I), V3.Values(I) + V2.Values(I));
         end if;
      end loop;

      return V3;
   end "+";
   
   
   function "-"(V1, V2: in Vector) return Vector is
      V3: Vector := V1;
      Last: Natural := V1.Pointer;
   begin 
      for I in Positive'First..Last loop
         if Has_Dimension_Name(V2, V3.Names(I)) then 
            Insert_Dimension(V3, V3.Names(I), V3.Values(I) - V2.Values(I));
         end if;
      end loop;

      return V3;
   end "-";
   
   
   procedure Insert(V: in out Vector; IA: IndexArray; VA: ValueArray) is
   begin 
      if IA'Length /= Va'Length then 
         return;
      end if;
      
      for i in IA'Range loop
        Insert_Dimension(V, IA(I), VA(I));
      end loop;
   end Insert;
   
   
   function Length(V: in Vector) return Return_Type is
     E: Elem := Get_First(V).Getter * Get_First(V).Getter;
   begin 
      for I in Positive'Succ(Positive'First)..V.Pointer loop
         E := E + ( V.Values(I) * V.Values(I) );
      end loop;
      return Sqrt(E);
   end Length;
   
   procedure Print(V1: Vector) is 
   begin 
      Put("( ");
      for I in 1..V1.Pointer loop
         Put("" & Index'Image( V1.Names(I)) & " = " & Elem_To_String( V1.Values(I)) & "" );
         if I = V1.Pointer then 
            exit;
         end if;
         Put(", ");          
      end loop;
      Put(") ");
      New_Line;
   end Print;
   
end Vectors;
