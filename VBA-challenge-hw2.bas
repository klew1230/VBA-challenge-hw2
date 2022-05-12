Attribute VB_Name = "Module1"
Sub MultipleYearStock()

  Dim ws As Worksheet

    For Each ws In Worksheets
    
    Dim i As Long
    
    Dim ticker_name As String
    
    Dim column As Double
    column = 1
    
    Dim yearly_change As Double

    yearly_change = 0
    
    Dim percentage_change As Double
    percentage_change = 0
    
    Dim summary_row As Integer
    summary_row = 2

    Dim total_vol As Double
    total_vol = 0
    
    maxperincrease = 0
    maxperticker = ""
    
    minperincrease = 9999999999#
    minperticker = ""
    
    ws.Range("J1").Value = "Ticker"
    ws.Range("K1").Value = "Yearly"
    ws.Range("L1").Value = "Percent Change"
    ws.Range("M1").Value = "Total Stock Volume"
    ws.Range("P2").Value = "Greatest % increase"
    ws.Range("P3").Value = "Greatest % decrease"
    ws.Range("P4").Value = "Greatest total volume"
    ws.Range("Q1").Value = "Ticker"
    ws.Range("R1").Value = "Value"
    
        
    openingprice = ws.Cells(2, 3).Value
    
    lastrow = Cells(Rows.Count, 1).End(xlUp).Row
    For i = 2 To lastrow
    
        total_vol = total_vol + ws.Cells(i, 7).Value
    
        If ws.Cells(i + 1, column).Value <> ws.Cells(i, column).Value Then
            
            ticker_name = ws.Cells(i, column).Value
            
            closingprice = ws.Cells(i, 6).Value
            
            yearly_change = closingprice - openingprice
            
            If (openingprice > 0) Then
          
                percent_change = yearly_change / openingprice
            
            Else
                percent_change = 0
                
                End If

            If percent_change > maxperincrease Then
                maxperincrease = percent_change
                maxperticker = ticker_name
                
            End If
            
            If percent_change < minperincrease Then
                minperincrease = percent_change
                minperticker = ticker_name
            
            End If
            
            If total_vol > great_tot_vol Then
                gtv_ticker = ticker_name
                great_tot_vol = total_vol
            
            End If
            
            
            
            ws.Cells(summary_row, 10).Value = ticker_name
            
            ws.Cells(summary_row, 11).Value = yearly_change
            
            If ws.Cells(summary_row, 11).Value > 0 Then
                ws.Cells(summary_row, 11).Interior.ColorIndex = 4
            
            ElseIf ws.Cells(summary_row, 11).Value < 0 Then
                ws.Cells(summary_row, 11).Interior.ColorIndex = 3
                
            End If
            
            ws.Cells(summary_row, 12).Value = percent_change
            
            ws.Cells(summary_row, 13).Value = total_vol
            
            
            ws.Cells(2, 17).Value = maxperticker
            
            ws.Cells(2, 18).Value = maxperincrease
            
            
            ws.Cells(3, 17).Value = minperticker
            
            ws.Cells(3, 18).Value = minperincrease
            
            
            ws.Cells(4, 17).Value = gtv_ticker
            
            ws.Cells(4, 18).Value = great_tot_vol
            
             
            summary_row = summary_row + 1
             
            openingprice = ws.Cells(i, 3).Value
            
            total_vol = 0
        
        End If
    
    Next i
    
  Next ws

End Sub
