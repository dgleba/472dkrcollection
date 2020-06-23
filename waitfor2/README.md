# Purpose

This is to test multiple wait-for-it.sh. Wait for two other containers.

https://github.com/vishnubob/wait-for-it


# How

   - start w1, but do not start w2 or w3. w1 must wait for w2 and w3.
   - you will see w1 wait for w2/w3. wait-for-it continues 1 seconds after w2/w3 starts.

## Commands to start it..

```
make up
```

Notice w1 waits for w2. 

Start a new terminal and start w2 using the next command below. You can see that w1 moves to waiting for w3 one second after w2 starts.

```
make up2
```

Start w3 in another terminal and notice everything is now started one second after w3 starts.

```
make up3
```

If w2 or w3 do not start, an error occurs after 299 seconds due to the timeout. An example is in the line:  `./wait-for-it.sh w2:80 -t 299 `

You can visit the webpages at `ip:port` in your browser.
I was using `192.168.88.60:14221`



# Notes

1.

https://devopscube.com/run-scripts-docker-arguments/

When ENTRYPOINT and CMD used in the same Dockerfile, everything in the CMD instruction will be appended to the ENTRYPOINT as argument.


2.

I want to  `call normal entrypoint after my custom entrypoint`

ref.

https://github.com/docker-library/wordpress/issues/205


3.

 - dockerfile for nginx

 https://github.com/nginxinc/docker-nginx/blob/2ef3fa66f2a434cd5e44e35a02f4ac502cf50808/mainline/buster/Dockerfile

 - .

4.

   wait for it example.

   https://mariobuonomo.dev/blog/docker-compose-wait-it-for-service


.

