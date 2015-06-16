unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Memo1: TMemo;
    Button4: TButton;
    CheckBox1: TCheckBox;
    Panel2: TPanel;
    Button5: TButton;
    Button6: TButton;
    procedure FormResize(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  selectedFile,selectedsaveFile : string;
  myFile,mysaveFile : TextFile;
  Sarray: array of string;
  Iarray: array of array of double;  //end file variables;
implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
Var first: string;
i,j,k: integer;
begin
    FormatSettings.DecimalSeparator:='.';
    if VCL.Dialogs.PromptForFileName(selectedFile,
                       'TXT files|*.txt',
                       '',
                       'Select your data file',
                       GetCurrentDir,
                       False)
  then
        begin


         end;

   if length(selectedFile)<=3 then begin
    ShowMessage('Warning: you have not selected any files');
          FormatSettings.DecimalSeparator:=','; exit;
        end else   Form1.Memo1.Lines.Add('Selected file= '+selectedFile);

  AssignFile(myFile, selectedFile);
  Reset(myFile);
  first:='';     k:=0;
     ReadLn(myfile,first);
        ReadLn(myfile,first);
           ReadLn(myfile,first);
              ReadLn(myfile,first);
                 ReadLn(myfile,first);
                    ReadLn(myfile,first);

  SetLength(Sarray,320);
  while not Eof(myFile) do
  begin   inc(k);
    ReadLn(myfile,first);
       Sarray[k]:=first;
  //  Form1.Memo1.Lines.Add(first);
  // Form1.Memo1.Lines.Add(InttoStr(k));
  // if (k=320) then    Form1.Memo1.Lines.Add(Sarray[k]);


  end;
  if eof(myFile) then
   Form1.Memo1.Lines.Add('Reading has been completed already!');

  CloseFile(myFile);
   FormatSettings.DecimalSeparator:=',';
end;

procedure TForm1.Button2Click(Sender: TObject);
Var i,j,p,k: integer;

s,s1,s2: string;
begin
if length(Sarray)=0 then  exit else
begin
      SetLength(Iarray,length(Sarray),240);
     for j := 0 to Length(Iarray)-1 do
       for k := 0 to Length(Iarray[j])-1 do
      Iarray[j,k]:=0;

    for I := 1 to length(Sarray) do BEGIN

    Application.ProcessMessages();
    if Form1.CheckBox1.Checked then

    Form1.Memo1.Lines.Add('string= '+Sarray[i]);
    s:='';
          s1:=''; p:=0;    s2:='';
    for j := Length(InttoStr(i))+1 to length(Sarray[i]) do
    if (ord(Sarray[i][j])>=44)and(ord(Sarray[i][j])<=57) then
    begin
   s:=s+ Sarray[i][j]; s1:=s1+Sarray[i][j]; end
    else begin s:=s+' ';
    if Length(s1)>1 then begin Iarray[i-1,p]:=StrToFloat(s1);inc(p);
     s2:=s2+' '+FloattoStr( Iarray[i-1,p-1]);    s1:='';
   // Form1.Memo1.Lines.Add('Iarray='+InttoStr(p-1)+' = '+FloattoStr( Iarray[i-1,p-1]));
       end;
     end;
 // Form1.Memo1.Lines.Add('s='+s);
 if Form1.CheckBox1.Checked then
   Form1.Memo1.Lines.Add('Iarray='+InttoStr(i)+' ='+s2);


                          END;
    Form1.Memo1.Lines.Add('Parsing has been completed already!');
end;


end;

procedure TForm1.Button3Click(Sender: TObject);
Var saveDialog : TSaveDialog;
 buttonSelected,i,j : Integer;
begin
  if Length(Iarray)<>0 then begin

       buttonSelected := VCL.Dialogs.MessageDlg('Save to new file?',mtCustom,
   [mbYes,mbCancel], 0);

if buttonSelected = mrYes    then begin
  saveDialog := TSaveDialog.Create(self);
 saveDialog.Title := 'Save your  data into new file';
 saveDialog.InitialDir := GetCurrentDir;
 saveDialog.Filter := 'Dat file|.dat';
 saveDialog.DefaultExt := 'dat';
  saveDialog.FilterIndex := 1;

  if saveDialog.Execute
  then ShowMessage('File : '+saveDialog.FileName)
  else begin ShowMessage('Data saving was cancelled'); exit; end;

  selectedsavefile:=saveDialog.FileName;
saveDialog.Free; end;

 if buttonSelected = mrCancel then exit;

      AssignFile(mysavefile,selectedsaveFile); Rewrite(mysavefile);
       FormatSettings.DecimalSeparator:='.';
 for I := 0 to Length(Iarray)-1 do
   for J := 0 to Length(Iarray[i])-1 do
     begin
    WriteLn(mysavefile,FloatToStrf(i+1,ffFixed,6,3)+'  '+FloatToStrf(j+1,ffFixed,6,3)+'  '+FloatToStrf(Iarray[i,j],ffFixed,7,3));

     end;

          FormatSettings.DecimalSeparator:=',';
       CloseFile(mysaveFile);
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
Form1.Memo1.Clear;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
Application.Minimize;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
Application.Terminate;

end;

procedure TForm1.FormResize(Sender: TObject);
begin
Form1.Memo1.Width:=round(Form1.Width*0.85);
Form1.Memo1.Height:=round(Form1.Height*0.8);
 Form1.Panel2.Left:=round(Form1.Width*0.85);
end;

end.
