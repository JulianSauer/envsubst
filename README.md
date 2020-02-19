# envsubst
Similar to the Linux command `envsubst < file > newFile` this script can replace environment variables in files.
However it reads environment variables from files and can work in-place.

The script expects two directories as parameters: One containing files with key-value pairs, one containing files where variables should be replaced with values.
If the flag `--any` is provided, the script will read all files found in those directories and write the results into the read files.
Otherwise only files ending with `.env` are used for key-value pairs and files with the naming scheme `<file>.variable` will be used as a template to write the results into `<file>`.

## Example
```
$ ./envsubst --env ~/environment-directory/ --sub ~/variable-directory/ --out=~/output-directory/
2019/12/10 10:36:57 Looking for environment variables in ~/environment-directory/
2019/12/10 10:36:57 Looking for variables to replace in ~/variable-directory/
2019/12/10 10:36:57 Writing output to ~/output-directory/
2019/12/10 10:36:57 _____________________________________
2019/12/10 10:36:57
2019/12/10 10:36:57 Reading ~/environment-directory/test.env
2019/12/10 10:36:57 Reading ~/variable-directory/test.txt.variable
2019/12/10 10:36:57 Writing ~/output-directory/test.txt
```

## Docker
You can use Docker to run the script by simply mounting the two directories:
```
docker run --rm -v ~/environment-directory:/env -v ~/variable-directory:/sub -v ~/output-directory:/out docker.pkg.github.com/juliansauer/envsubst/envsubst:latest
```
