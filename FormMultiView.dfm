object FormViewer: TFormViewer
  Left = 0
  Top = 0
  Caption = 'FormViewer'
  ClientHeight = 344
  ClientWidth = 843
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = -6
    Top = 0
    Width = 841
    Height = 345
    Cursor = crArrow
    ActivePage = TabSheet2
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'TableView'
      object Label1: TLabel
        Left = 33
        Top = 16
        Width = 24
        Height = 13
        Caption = 'From'
      end
      object Label2: TLabel
        Left = 254
        Top = 16
        Width = 12
        Height = 13
        Caption = 'To'
      end
      object DBGrid1: TDBGrid
        Left = 406
        Top = 3
        Width = 427
        Height = 314
        DataSource = DataSource1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'id'
            Width = 31
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'temp'
            Title.Caption = 'temperature'
            Width = 69
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'rh'
            Title.Caption = 'relative humidity(%)'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'month'
            Width = 69
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'day'
            Width = 69
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'hour'
            Width = 78
            Visible = True
          end>
      end
      object fromDateTimePicker: TDateTimePicker
        Left = 80
        Top = 16
        Width = 97
        Height = 21
        Date = 42736.000000000000000000
        Time = 42736.000000000000000000
        MaxDate = 2958464.999988426000000000
        TabOrder = 1
      end
      object toDateTimePicker: TDateTimePicker
        Left = 272
        Top = 16
        Width = 97
        Height = 21
        Date = 43100.000000000000000000
        Time = 43100.000000000000000000
        MaxDate = 2958464.999988426000000000
        TabOrder = 2
      end
      object GroupBox1: TGroupBox
        Left = 8
        Top = 43
        Width = 377
        Height = 105
        Caption = 'Temperature range(C)'
        TabOrder = 3
        object Label_minTemp: TLabel
          Left = 18
          Top = 28
          Width = 16
          Height = 13
          Caption = '-10'
        end
        object Label_maxTemp: TLabel
          Left = 22
          Top = 60
          Width = 12
          Height = 13
          Caption = '40'
        end
        object maxTempTrackBar: TTrackBar
          Left = 40
          Top = 55
          Width = 334
          Height = 25
          Max = 40
          Min = -10
          Position = 40
          TabOrder = 0
          OnChange = maxTempTrackBarChange
        end
        object minTempTrackBar: TTrackBar
          Left = 40
          Top = 16
          Width = 334
          Height = 33
          Hint = '1'
          Max = 40
          Min = -10
          ParentShowHint = False
          Position = -10
          ShowHint = False
          TabOrder = 1
          TickMarks = tmTopLeft
          OnChange = minTempTrackBarChange
        end
      end
      object GroupBox2: TGroupBox
        Left = 8
        Top = 175
        Width = 377
        Height = 105
        Caption = 'Relative Humidity Range(%)'
        TabOrder = 4
        object Label_maxHR: TLabel
          Left = 25
          Top = 60
          Width = 12
          Height = 13
          Caption = '90'
        end
        object Label_minHR: TLabel
          Left = 25
          Top = 28
          Width = 12
          Height = 13
          Caption = '10'
        end
        object maxRHTrackBar: TTrackBar
          Left = 43
          Top = 55
          Width = 331
          Height = 25
          Max = 100
          Position = 90
          TabOrder = 0
          OnChange = maxRHTrackBarChange
        end
        object minRHTrackBar: TTrackBar
          Left = 43
          Top = 16
          Width = 331
          Height = 25
          Max = 100
          Position = 10
          TabOrder = 1
          TickMarks = tmTopLeft
          OnChange = minRHTrackBarChange
        end
      end
      object queryButton: TButton
        Left = 8
        Top = 289
        Width = 374
        Height = 25
        Caption = 'Query'
        TabOrder = 5
        OnClick = queryButtonClick
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Temperature LineView'
      ImageIndex = 1
      object DBChart1: TDBChart
        Left = 0
        Top = 0
        Width = 833
        Height = 317
        Title.Text.Strings = (
          'Temperature(C) LineView')
        View3D = False
        Align = alClient
        TabOrder = 0
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 13
        object Series1: TLineSeries
          DataSource = FDQuery_NIWA
          XLabelsSource = 'month'
          Brush.BackColor = clDefault
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          XValues.Name = 'X'
          XValues.Order = loAscending
          XValues.ValueSource = 'month'
          YValues.Name = 'Y'
          YValues.Order = loNone
          YValues.ValueSource = 'temp'
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Relative Humidity LineView'
      ImageIndex = 2
      object DBChart2: TDBChart
        Left = 0
        Top = 0
        Width = 833
        Height = 317
        Title.Text.Strings = (
          'Relative Humidity(%) Lineview')
        View3D = False
        Align = alClient
        TabOrder = 0
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 13
        object Series2: TLineSeries
          DataSource = FDQuery_NIWA
          XLabelsSource = 'month'
          Brush.BackColor = clDefault
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          XValues.Name = 'X'
          XValues.Order = loAscending
          XValues.ValueSource = 'id'
          YValues.Name = 'Y'
          YValues.Order = loNone
          YValues.ValueSource = 'rh'
        end
      end
    end
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=SQLite'
      'Database=D:\MyProject\DelphiProject\TempViewer\NIWA.db'
      'DateTimeFormat=DateTime'
      'StringFormat=Unicode')
    Connected = True
    LoginPrompt = False
    Left = 608
    Top = 296
  end
  object FDQuery_NIWA: TFDQuery
    Active = True
    OnCalcFields = FDQuery_NIWACalcFields
    Connection = FDConnection1
    SQL.Strings = (
      'select * from temp2017Date;')
    Left = 656
    Top = 296
  end
  object DataSource1: TDataSource
    DataSet = FDQuery_NIWA
    Left = 736
    Top = 296
  end
end
