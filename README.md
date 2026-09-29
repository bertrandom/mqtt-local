# mqtt-local

I sometimes need to run a local MQTT server on my Mac, this sets one up and starts it.

# Installation

Check out this repo somewhere:

```
git clone https://github.com/bertrandom/mqtt-local.git
cd mqtt-local
```

Generate a passwd file:
```
./generate_passwd.sh
```

The username and password can be specified, like this:
```
./generate_passwd.sh mqtt password
```

but if arguments aren't passed in, these are the credentials

| username | mqtt |
| -------- | ---- |
| password | mqtt |

Note: Running `./generate_passwd.sh` erases the existing `passwd` file.

# Usage

Start the server:

```
./mqtt_local.sh
```

I suggest symlinking it into your path so you can run it from anywhere, e.g.:
```
cd ~/bin
ln -s ~/code/mqtt-local/mqtt_local.sh mqtt-local
```