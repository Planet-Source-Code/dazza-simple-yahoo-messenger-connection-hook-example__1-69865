VERSION 5.00
Begin VB.Form Form2 
   BorderStyle     =   1  'Fixed Single
   Caption         =   " [DEBUG]"
   ClientHeight    =   4710
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   9030
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   ScaleHeight     =   4710
   ScaleWidth      =   9030
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text2 
      Appearance      =   0  'Flat
      Height          =   2295
      Left            =   0
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   1
      Top             =   2400
      Width           =   9015
   End
   Begin VB.TextBox Text1 
      Appearance      =   0  'Flat
      Height          =   2295
      Left            =   0
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Text1_Change()
On Error Resume Next
Text1.SelStart = Len(Text1.Text)
End Sub

Private Sub Text2_Change()
On Error Resume Next
Text2.SelStart = Len(Text2.Text)
End Sub

Public Sub IdeBug(iData As String)
On Error Resume Next
Dim Temp As String, Ttyp As String
If Form1.Check1 = vbChecked Then
Temp = Replace(iData, Chr(0), "*")
Ttyp = Mid(iData, 12, 1)
Text1.Text = Text1.Text & Asc(Ttyp) & "  -  " & Temp & vbCrLf & vbCrLf
End If
End Sub

Public Sub OdeBug(oData As String)
On Error Resume Next
Dim Temp As String, Ttyp As String
If Form1.Check1 = vbChecked Then
Temp = Replace(oData, Chr(0), "*")
Ttyp = Mid(oData, 12, 1)
Text2.Text = Text2.Text & Asc(Ttyp) & "  -  " & Temp & vbCrLf & vbCrLf
End If
End Sub
