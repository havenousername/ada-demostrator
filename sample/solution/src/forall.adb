package body forall is
    procedure For_All ( V : in out Vector) is
    begin
        for i in V'Range loop
            Action (V(i));
        end loop;
    end For_All;
end forall;
