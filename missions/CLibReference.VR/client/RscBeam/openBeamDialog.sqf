
private _cond = (
    !dialog and 
    !(player getVariable ["ace_dragging_isDragging", false]) and 
    !(player getVariable ["ace_dragging_isCarrying", false])
);

if (_cond) then 
{
    createDialog "DialogBeam";
};
