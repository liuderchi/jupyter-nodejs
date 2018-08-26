# Jupyter NodeJS

📒 A JavaScript Notebook running in Container 🐳 with NodeJS support

<br/>
<br/>

![demo-1][demo-1]

## Running Online in [_Play With Docker_][pwd-link] (free)

1. Click [![Try in PWD][try-pwd-img]][try-pwd-link] to launch a new container. After the stack builder is finished, close the dialog.

  ![pwd-run-1][pwd-run-1]

2. Get Access Token by running this command in the terminal prompt:

  ```sh
  docker logs $(docker container list | awk 'FNR==2{print $1}') 2>&1 \
    | grep -E 'token=(.*)' -o | cut -c7-54
  ```

3. Click the link above to access Jupyter page:

  ![pwd-run-2][pwd-run-2]

4. In page paste the token in the input field to login

  ![pwd-run-3][pwd-run-3]

5. 🎉 Congrats! Now you can create a NodeJS Notebook!

  ![pwd-run-4][pwd-run-4]

## Run in Your Local Machine

1. Run Following command in your terminal:

  ```bash
  docker run -d -p 8888:8888 liuderchi/jupyter-nodejs:latest
  ```

2. Run following command to get Jupyter token. Then Copy it.

  ```bash
  docker logs $(docker container list | awk 'FNR==2{print $1}') 2>&1 \
      | grep -E 'token=(.*)' -o | cut -c7-54
  ```

3. in browser go to `localhost:8888?token=PASTE_JUPYTER_TOKEN_HERE`


## Develop Your Custom Script

```bash
$ git clone https://github.com/liuderchi/jupyter-nodejs.git
$ cd learn-js-in-jupyter
$ docker run -d -p 8888:8888 \
  -v $PWD/custom:/root/.jupyter/custom \
  liuderchi/jupyter-nodejs:latest
# print jupyter token
$ docker logs $(docker container list | awk 'FNR==2{print $1}') 2>&1 \
  | grep -E 'token=(.*)' -o | cut -c7-54
```

in browser go to `localhost:8888?token=PASTE_JUPYTER_TOKEN_HERE`

## Inspiration

This project is a fork from [notablemind/jupyter-nodejs][notablemind/jupyter-nodejs]

## License

[MIT License][mit-license]

[demo-1]: https://user-images.githubusercontent.com/4994705/44618252-22b29800-a8a5-11e8-938e-ffaca3c80718.png
[pwd-link]: https://labs.play-with-docker.com/
[try-pwd-img]: https://cdn.rawgit.com/play-with-docker/stacks/cff22438/assets/images/button.png
[try-pwd-link]: http://play-with-docker.com?stack=https://raw.githubusercontent.com/liuderchi/jupyter-nodejs/master/stack.yml
[pwd-run-1]: https://user-images.githubusercontent.com/4994705/44618078-d87be780-a8a1-11e8-9226-7f36616f90cc.png
[pwd-run-2]: https://user-images.githubusercontent.com/4994705/42303031-6e6cbebe-8051-11e8-8dea-928481c0f4e4.png
[pwd-run-3]: https://user-images.githubusercontent.com/4994705/44618015-c51c4c80-a8a0-11e8-903a-5627ee53a153.png
[pwd-run-4]: https://user-images.githubusercontent.com/4994705/44618387-5393cc80-a8a7-11e8-9518-dcadb04c449f.png
[notablemind/jupyter-nodejs]: https://github.com/notablemind/jupyter-nodejs
[mit-license]: https://liuderchi.mit-license.org/ 'mit-license'
