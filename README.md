# Memory Leak Application

This application is a simple Rails application designed to demonstrate
an apparent memory leak when running on Torquebox.

The application has two main parts. A Service which will publish 
a message to the "/queues/node-reporting" queue every 100ms and a 
Message Processor which will process this message.

The Message Processor saves / updates an ActiveRecord model with the
information in the message.

The application will wait for 1 minute after boot before message
processing starts. 

It takes about 7 minutes to use up all the memory, send the GC into 
an almost constant series of GC cycles and spike the CPU usage.

I have made no attempts to do anything special in the code to mitigate
this. I have tried a few methods in the real application as suggested
here:

http://markmail.org/message/6vvbpftfm6roupj2?q=torquebox-user


