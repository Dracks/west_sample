# West sample project
This project is a sample of how to use [West framework](https://github.com/Dracks/west) to create a small site

You can see also a sample of github workflows to pass the workflows to validate the service is ok

If you wish to test this, you can use the docker image dracks/west-sample runing the following line:

```
docker run --rm --name west-sample -p 8010:8010 dracks/west-sample
```


## Features
* Two controllers with a different paths `'/'` and `'/config'`
* Dinamic configuration from environment vars, run it with `port=1234 v run .` to see how the service start at port 1234
* global modules (used in the configuration)
* use instance (to import an object which we already know the value)

