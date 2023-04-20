{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit RComponent;

{$warn 5023 off : no warning about unused units}
interface

uses
  UClerk, LazarusPackageIntf;

implementation

procedure Register;
begin
  RegisterUnit('UClerk', @UClerk.Register);
end;

initialization
  RegisterPackage('RComponent', @Register);
end.
