VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Example YPAGER Hook"
   ClientHeight    =   1665
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   2880
   LinkTopic       =   "Form3"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1665
   ScaleWidth      =   2880
   StartUpPosition =   3  'Windows Default
   Begin VB.ComboBox Text1 
      Height          =   315
      ItemData        =   "Form1.frx":0000
      Left            =   120
      List            =   "Form1.frx":000A
      TabIndex        =   3
      Text            =   "YahooMessenger.exe"
      Top             =   480
      Width           =   2415
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   2280
      Top             =   0
   End
   Begin VB.CommandButton Command2 
      Caption         =   "stop"
      Height          =   255
      Left            =   1440
      TabIndex        =   2
      Top             =   1080
      Width           =   975
   End
   Begin VB.CommandButton Command1 
      Caption         =   "start"
      Height          =   255
      Left            =   360
      TabIndex        =   1
      Top             =   1080
      Width           =   975
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Debug?"
      Height          =   255
      Left            =   240
      TabIndex        =   0
      Top             =   120
      Width           =   1095
   End
   Begin MSWinsockLib.Winsock Winsock2 
      Left            =   1800
      Top             =   0
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin MSWinsockLib.Winsock Winsock1 
      Left            =   1320
      Top             =   0
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Check1_Click()
On Error Resume Next
Form2.Show
End Sub

Private Sub Command1_Click()
On Error Resume Next
Winsock2.RemoteHost = "scs.msg.yahoo.com"
Winsock1.LocalPort = "5050"
Winsock1.Listen
DoEvents
Timer1.Enabled = True
End Sub

Private Sub Command2_Click()
On Error Resume Next
Winsock1.Close
Winsock2.Close
End Sub

Private Sub Form_Unload(Cancel As Integer)
On Error Resume Next
Winsock1.Close
Winsock2.Close
DoEvents
Unload Form2
End
End Sub

Private Sub Winsock1_Close()
On Error Resume Next
Winsock1.Close
Winsock2.Close
Winsock1.Listen
End Sub

Private Sub Winsock1_ConnectionRequest(ByVal requestID As Long)
On Error Resume Next
Winsock2.RemotePort = Winsock1.LocalPort
Winsock2.Connect
Do
DoEvents
Loop Until Winsock2.State = sckConnected
Winsock1.Close
Winsock1.Accept requestID
End Sub

Private Sub Winsock1_DataArrival(ByVal bytesTotal As Long)
On Error Resume Next
Dim Data As String
Winsock1.GetData Data
ParseYmsgClient Data, Winsock2
End Sub

Private Sub Winsock1_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
On Error Resume Next
Winsock1.Close
Winsock2.Close
Winsock1.Listen
End Sub

Private Sub Winsock2_Close()
On Error Resume Next
Winsock1.Close
Winsock2.Close
Winsock1.Listen
End Sub

Private Sub Winsock2_DataArrival(ByVal bytesTotal As Long)
On Error Resume Next
Dim Data As String
Winsock2.GetData Data
ParseYmsgServer Data, Winsock1
End Sub

Private Sub Winsock2_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
On Error Resume Next
Winsock1.Close
Winsock2.Close
Winsock1.Listen
End Sub

Public Sub InsertDll(TheExe As String, TheDll As String)
On Error Resume Next
ProsH = GetHProcExe(TheExe)
If ProsH = 0 Then
Exit Sub
Else
Timer1.Enabled = False
InjectDll TheDll, ProsH
End If
End Sub

Private Sub Timer1_Timer()
On Error Resume Next
InsertDll Text1.Text, App.Path & "\YHook.dll"
End Sub




' filter packets here
Sub ParseYmsgClient(YMData As String, Sck As Winsock)
On Error Resume Next
Sck.SendData YMData
Form2.OdeBug YMData
End Sub

Sub ParseYmsgServer(YMData As String, Sck As Winsock)
On Error Resume Next
Sck.SendData YMData
Form2.IdeBug YMData
End Sub
