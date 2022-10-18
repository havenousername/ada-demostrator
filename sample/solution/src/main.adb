with ada.text_io,
     ada.integer_text_io, ForAll, Vectors;
 with Ada.Numerics.Elementary_Functions, Ada.Command_Line;
use ada.text_io, ada.integer_text_io, forall;



procedure Main is
   procedure Decode ( S: in out String) is
      Iter_S: Positive := S'First;
      Iter_Tmp: Positive := S'First;
      Tmp_Str: String(S'First..S'Last) := (others => ' ');
   begin
      loop
         exit when Iter_S > S'Last;
         Tmp_Str(Iter_Tmp) := S(Iter_S);

         declare
            Additor: Positive := Positive'First;
         begin
            while Iter_S + Additor <= S'Last and then ( S(Iter_S) = S(Iter_S + Additor) ) loop
               Additor := Positive'Succ(Additor);
            end loop;

            Iter_S := Iter_S + Additor;
         end;

         Iter_Tmp := Positive'Succ(Iter_Tmp);
      end loop;


      S := Tmp_Str;
   end Decode;

   type Index is range 1..3;
   subtype Element is String (1..9);
   type MyVector is array(Index) of Element;


   procedure print_vector (V : in myVector) is
   begin
       for i in V'Range loop
          put_line(V(i));
       end loop;
   end print_vector;

   procedure Decode_For_All is new For_All(Index, Element, MyVector, Decode);

   test1: String := "Hoookaaah";
   test2: String := "Hhoohahh ";
   test3: String := "Hookahhhh";
   V : myVector;


   MARK: Positive := 3;

   -- 3
   package Integer_Vector is new Vectors(Character, Integer);
   V1: Integer_Vector.Vector(3);
   V2: Integer_Vector.Vector(3);
   V3: Integer_Vector.Vector(3);

   -- 4
   function Sqrt_Integer(I: Integer) return Float is
   begin

      return Ada.Numerics.Elementary_Functions.Sqrt(Float(I));
   end Sqrt_Integer;

   function Integer_Vector_Length is new Integer_Vector.Length(Float, Sqrt_Integer);

   procedure Print_Integer_Vector is new Integer_Vector.Print(Integer'Image);

   -- 5
   type Ind is new Positive range 1..3;
   type Integer_Vector_Array is array (Ind) of Integer_Vector.Vector;
   V_Arr: Integer_Vector_Array;
   V_Arr_Counter: Ind := 1;

   function Is_Integer(N: String) return Boolean is
      Num: Integer;
   begin
      Num := Integer'Value(N);
      return True;
   exception
      when others =>
         return False;
   end Is_Integer;
   type Range_XYZ is range 1..3;
   type XYZArray is array (Range_XYZ) of Character;


   V_Length: Float := 0.0;
   procedure Length_Wrapper(V: in out Integer_Vector.Vector) is
   begin
      V_Length := V_Length + Integer_Vector_Length(V);
   end Length_Wrapper;


   -- generics
   procedure All_Length is new For_All(Ind, Integer_Vector.Vector, Integer_Vector_Array, Length_Wrapper);
begin
   if MARK = 2 then
      V(1) := test1;
      V(2) := test2;
      V(3) := test3;

      --Put_Line(test1(test1'Last)'Image);
      put_line("Before action");
      print_vector(V);
      Decode_For_All(V);
      New_Line;
      put_line("After action");
      print_vector(V);
   else
      Integer_Vector.Insert_Dimension(V1, 'x', 3);
      Integer_Vector.Insert_Dimension(V1, 'y', 5);
      Integer_Vector.Insert_Dimension(V1, 'z', 5);

      Integer_Vector.Insert_Dimension(V2, 'x', -4);
      Integer_Vector.Insert_Dimension(V2, 'y', 10);
      Integer_Vector.Insert_Dimension(V2, 'z', 0);

      V3 := Integer_Vector."+"(V1, V2);
      -- -1
      Put_Line(Integer'Image(Integer_Vector.Get(V3, 'x').Getter));

      -- TASK 4
      Put_Line(Float'Image(Integer_Vector_Length(V1)));

      -- TASK 5
      declare
         XYZ: XYZArray := ('x', 'y', 'z');
         XYZ_Index: Range_XYZ := Range_XYZ'First;
      begin
         for I in 1..Ada.Command_Line.Argument_Count loop
            if Is_Integer(Ada.Command_Line.Argument(I)) then
               Integer_Vector.Insert_Dimension(
                                     V_Arr(V_Arr_Counter),
                                     XYZ(XYZ_Index),
                                     Integer'Value(Ada.Command_Line.Argument(I))
                                    );
               if XYZ_Index < 3 then
                  XYZ_Index := XYZ_Index + 1;
               else
                  XYZ_Index := XYZArray'First;
               end if;
            else
               V_Arr_Counter := V_Arr_Counter + 1;
         end if;
         end loop;
      end;


      for I in V_Arr'Range loop
          Print_Integer_Vector(V_Arr(I));
      end loop;

      All_Length(V_Arr);

      Put_Line("All length is " & Float'Image(V_Length));

   end if;
end Main;
