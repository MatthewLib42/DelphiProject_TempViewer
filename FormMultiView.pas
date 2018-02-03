unit FormMultiView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Tabs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, VclTee.TeeGDIPlus,
  VCLTee.TeEngine, VCLTee.Series, Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart,
  VCLTee.DBChart,System.StrUtils ;

type
  TFormViewer = class(TForm)
    FDConnection1: TFDConnection;
    FDQuery_NIWA: TFDQuery;
    DataSource1: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    DBChart1: TDBChart;
    Series1: TLineSeries;
    fromDateTimePicker: TDateTimePicker;
    toDateTimePicker: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    maxTempTrackBar: TTrackBar;
    minTempTrackBar: TTrackBar;
    GroupBox2: TGroupBox;
    maxRHTrackBar: TTrackBar;
    minRHTrackBar: TTrackBar;
    queryButton: TButton;
    Label_minTemp: TLabel;
    Label_maxTemp: TLabel;
    Label_maxHR: TLabel;
    Label_minHR: TLabel;
    TabSheet3: TTabSheet;
    DBChart2: TDBChart;
    Series2: TLineSeries;
    procedure Button1Click(Sender: TObject);
    procedure FDQuery_NIWACalcFields(DataSet: TDataSet);
    procedure queryButtonClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure minTempTrackBarChange(Sender: TObject);
    procedure maxTempTrackBarChange(Sender: TObject);
    procedure minRHTrackBarChange(Sender: TObject);
    procedure maxRHTrackBarChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormViewer: TFormViewer;

implementation

{$R *.dfm}

procedure TFormViewer.Button1Click(Sender: TObject);
begin
  FDQuery_NIWA.Active :=false;
  //FDQuery_NIWA.SQL := Memo_SQL.Lines;
  FDQuery_NIWA.Active :=true;

end;

procedure TFormViewer.Button2Click(Sender: TObject);
begin
  FDQuery_NIWA.Active := false;
  //FDQuery_NIWA.SQL.Text := Memo_SQL.Lines.Text;


  FDQuery_NIWA.Active := true;
end;

procedure TFormViewer.FDQuery_NIWACalcFields(DataSet: TDataSet);
begin
  FDQuery_NIWA.FieldByName('date').AsString :='201711';
end;

procedure TFormViewer.maxRHTrackBarChange(Sender: TObject);
begin
   Label_maxHR.Caption := TCaption(maxRHTrackBar.Position.ToString);
end;

procedure TFormViewer.maxTempTrackBarChange(Sender: TObject);
begin
   Label_maxTemp.Caption := TCaption(maxTempTrackBar.Position.ToString);
end;

procedure TFormViewer.minRHTrackBarChange(Sender: TObject);
begin
    Label_minHR.Caption := TCaption(minRHTrackBar.Position.ToString);
end;

procedure TFormViewer.minTempTrackBarChange(Sender: TObject);
begin
  Label_minTemp.Caption := TCaption(minTempTrackBar.Position.ToString);
end;

procedure TFormViewer.queryButtonClick(Sender: TObject);
{the most important thing is the formate of datetime,it must look like 2017-01-01 01:01:01}
var
sql_fromDate ,sql_toDate :TDateTime ;
sql_minTemp,sql_maxTemp,sql_minRH,sql_maxRH : Integer;
Query,str_date,str_temp,str_rh,str_date_from,str_date_to: String;
date_year,date_month,date_day:Word;
begin
  sql_fromDate:=fromDateTimePicker.DateTime ;
  sql_toDate:=toDateTimePicker.DateTime ;

  DecodeDate( sql_fromDate, date_year,date_month,date_day);
  str_date_from := date_year.ToString +'-'+RightStr( '0'+date_month.ToString,2) +'-'+RightStr( '0'+date_day.ToString,2) +' 23:59:59'; ;

  DecodeDate( sql_toDate, date_year,date_month,date_day);
  str_date_to := date_year.ToString +'-'+RightStr( '0'+date_month.ToString,2) +'-'+RightStr( '0'+date_day.ToString,2) +' 23:59:59';




  sql_minTemp := minTempTrackBar.Position;
  sql_maxTemp := maxTempTrackBar.Position;
  str_temp :=  'temp <' + sql_maxTemp.ToString +' and temp > ' +sql_minTemp.ToString;

  sql_minRH := minRHTrackBar.Position;
  sql_maxRH := maxRHTrackBar.Position;
  str_rh :=  'rh <' + sql_maxRH.ToString +' and rh > ' +sql_minRH.ToString;



  Query  := 'SELECT * FROM temp2017Date WHERE ' +
            ' ( datetime(date) BETWEEN datetime(:StartDate) AND datetime(:EndDate)) ' +
          ' AND ( temp BETWEEN :MinTemp AND :MaxTemp) '+
          ' AND ( rh BETWEEN :MinRH AND :MaxRH)';



  FDQuery_NIWA.Active := false;
  FDQuery_NIWA.SQL.Text := Query;


  FDQuery_NIWA.ParamByName('StartDate').Value := str_date_from;
  FDQuery_NIWA.ParamByName('EndDate').Value := str_date_to;

  FDQuery_NIWA.ParamByName('MinTemp').AsInteger := sql_minTemp;
  FDQuery_NIWA.ParamByName('MaxTemp').AsInteger := sql_maxTemp;

  FDQuery_NIWA.ParamByName('MinRH').AsInteger := sql_minRH;
  FDQuery_NIWA.ParamByName('MaxRH').AsInteger := sql_maxRH;

  FDQuery_NIWA.Active := true;


end;

end.
