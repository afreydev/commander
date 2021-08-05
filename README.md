# commander
A wrapper to extract env vars from a bash script using a json file. E.g
```bash
commander.sh CUSTOM_PREFIX another_script.sh arg1 arg2 arg3

cat /opt/CUSTOM_PREFIX_variables.json
```
In the script wrapped the env variables should be exported with a name that starts with CUSTOM_PREFIX.
