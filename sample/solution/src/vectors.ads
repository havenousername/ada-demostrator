generic 
   type Index is new Character;
   type Elem is private;
   with function "+"(E1, E2: Elem) return Elem is <>;
   with function "-"(E1, E2: Elem) return Elem is <>;
package Vectors is
   subtype Dimension is Positive range 1..3;
   type Vector(D: Dimension := Dimension'Last) is private;
   
   type Get_Return is record 
      Exists: Boolean := False;
      Getter: Elem;
   end record;
   
   
   procedure Insert_Dimension(V: in out Vector; Name: Index; Value: Elem);
   function Dimensions(V: Vector) return Dimension;
   
   function Get(V: in Vector; Name: Index) return Get_Return;
   function Get_First(V: in Vector) return Get_Return;
   function Get_Last(V: in Vector) return Get_Return;
   
  
   function "+"(V1, V2: Vector) return Vector;
   function "-"(V1, V2: Vector) return Vector;
   
   generic 
      type Ind is (<>);
      type IndexArray is array (Ind range <>) of Index;
      type ValueArray is array (Ind range <>) of Elem;
   procedure Insert(V: in out Vector; IA: IndexArray; VA: ValueArray);
   
   
   -- 4
   generic
      type Return_Type is private;
      with function Sqrt(E1: Elem) return Return_Type;
      with function "*"(E1, E2: Elem) return Elem is <>;
   function Length(V: in Vector) return Return_Type;
   
   generic
      with function Elem_To_String(E: Elem) return String;
   procedure Print(V1: Vector);
private
   type TNameArray is array (Positive range <>) of Index;
   type TValueArray is array (Positive range <>) of Elem;
   
   type Vector(D: Dimension := Dimension'Last) is record 
      Names: TNameArray(Dimension'First..D);
      Values: TValueArray(Dimension'First..D);
      Pointer: Natural := Natural'First;
   end record;
end Vectors;
