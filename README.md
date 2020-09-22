<div align="center">

## simple yahoo messenger connection hook EXAMPLE


</div>

### Description

This example shows you how programs like "ytunnelpro" , "ytkpro", "yahoo ace"

might take yahoo messengers connection and filter it.

You will need the yhook.dll compiled and in the same folder as the exe.

You can compile the dll in the "YHOOKDLL" folder, or you can download a compiled copy here...

http://rapidshare.com/files/80903460/dllbin.zip

or

http://geocities.com/dllhookbin/dllbin.zip
 
### More Info
 
WHAT DOES IT DO??

It takes the connection by injecting a dll into yahoo messenger as it loads

so our dll replaces the socket connect function.

Then the dll will check the port and if the port is 5050 we redirect the host to 127.0.0.1

which makes yahoo messenger connect to 127.0.0.1:5050.

Then with the vb application we listen on port 5050 for the connection

and we then redirect that back to a yahoo host address.

by doing that we can filter the packets sent from both client and server blocking what we dont like.


<span>             |<span>
---                |---
**Submitted On**   |2008-01-03 06:40:10
**By**             |[ DaZZa ](https://github.com/Planet-Source-Code/PSCIndex/blob/master/ByAuthor/dazza.md)
**Level**          |Intermediate
**User Rating**    |5.0 (10 globes from 2 users)
**Compatibility**  |VB 4\.0 \(32\-bit\), VB 5\.0, VB 6\.0
**Category**       |[Internet/ HTML](https://github.com/Planet-Source-Code/PSCIndex/blob/master/ByCategory/internet-html__1-34.md)
**World**          |[Visual Basic](https://github.com/Planet-Source-Code/PSCIndex/blob/master/ByWorld/visual-basic.md)
**Archive File**   |[simple\_yah209610132008\.zip](https://github.com/Planet-Source-Code/dazza-simple-yahoo-messenger-connection-hook-example__1-69865/archive/master.zip)








