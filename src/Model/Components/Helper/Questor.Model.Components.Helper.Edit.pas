unit Questor.Model.Components.Helper.Edit;

interface
uses
  vcl.stdCtrls, System.SysUtils;
  type
    TModelComponentsHelperEdit = class helper for TEdit
    function ToInteger:Integer;
    end;


implementation

{ TModelComponentsHelperEdit }

function TModelComponentsHelperEdit.ToInteger: Integer;
begin
  Result := StrToIntDef(Self.Text,0);
end;

end.
