03/01/2008

simple yahoo messenger connection hook 'EXAMPLE'



this example shows you how programs like "ytunnelpro" , "ytkpro", "yahoo ace" 
take yahoo messengers connection and filter it.


   cLOSE YAHOO MESSENGER RUN OUR APP, CLICK START, THEN OPEN YAHOO MESSENGER.



WHAT DOES IT DO??
 It takes the connection by injecting a dll into yahoo messenger as it loads 
 so our dll replaces the socket connect function.

 Then the dll will check the port and if the port is 5050 we redirect the host to 127.0.0.1 
 which makes yahoo messenger connect to 127.0.0.1:5050. 

 Then with the vb application we listen on port 5050 for the connection 
 and we then redirect that back to a yahoo host address. 

 by doing that we can filter the packets sent from both client and server blocking what we dont like.




THERE are better ways to redirect the connections and better ways to have the vb application handle this!!
 this is an example to show you how its done so you can make your own :)




You will need the yhook.dll compiled and in the same folder as the exe.
You can compile the dll in the "YHOOKDLL" folder, or you can download a compiled copy here...

http://rapidshare.com/files/80903460/dllbin.zip

or

http://geocities.com/dllhookbin/dllbin.zip




All projects compile to the "App" folder by default