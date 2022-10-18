package forall is
    generic
        type Index is (<>);
        type Elem is private;
        type Vector is array(Index) of Elem;
        with procedure Action (el: in out Elem);
    procedure For_All( V: in out Vector);
end forall;
