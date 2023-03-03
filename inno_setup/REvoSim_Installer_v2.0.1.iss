; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{D1EF3B35-DFB4-4C81-843F-039890755617}
AppName=REvoSim and EnviroGen
AppVersion=2.0.1
;AppVerName=REvoSim 2.0.1
AppPublisher=REvoSim and EnviroGen Software by Palaeoware
AppPublisherURL=https://github.com/palaeoware/revosim/
AppSupportURL=https://github.com/palaeoware/revosim/
AppUpdatesURL=https://github.com/palaeoware/revosim/
DefaultDirName={pf}\Palaeoware\REvoSim\v2.0.1
DefaultGroupName=Palaeoware\REvoSim
ArchitecturesAllowed=x64
ArchitecturesInstallIn64BitMode=x64
LicenseFile=.\bin\LICENSE.md
OutputDir=.\build
OutputBaseFilename=REvoSimInstaller_v2.0.1_win_x64
Compression=lzma
SolidCompression=yes
ChangesAssociations=yes
AppCopyright=Copyright (C) 2008-2019 by Mark D. Sutton, Russell J. Garwood, and Alan R.T. Spencer
AppContact=palaeoware@gmail.com
AppComments=REvoSim (The [R]apid [Evo]lutionary [Sim]ulator program). More details are available in the documentation for the program.
BackColor=$3e3e3e
BackColor2=$3e3e3e

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: ".\bin\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\REvoSim (v2.0.1)"; Filename: "{app}\revosim.exe";
Name: "{group}\EnviroGen (v2.0.1)"; Filename: "{app}\envirogen.exe";
Name: "{group}\Uninstall (v2.0.1)"; Filename: "{uninstallexe}"

[Registry]
Root: HKCR; Subkey: ".revosim"; ValueType: string; ValueName: ""; ValueData: "REvoSimFile"; Flags: uninsdeletevalue
Root: HKCR; Subkey: "REvoSimFile"; ValueType: string; ValueName: ""; ValueData: "REvoSim File"; Flags: uninsdeletekey
Root: HKCR; Subkey: "REvoSimFile\DefaultIcon"; ValueType: string; ValueName: "0"; ValueData: "{app}\revosim.exe,0"
Root: HKCR; Subkey: "REvoSimFile\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\revosim.exe"" ""%1"""