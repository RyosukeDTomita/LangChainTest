# Setting up a Jupyter Notebook using a Docker container to use Lang Chain and access it through VS Code Jupyter extensions.

![un license](https://img.shields.io/github/license/RyosukeDTomita/LangChainTest)

## INDEX

- [ABOUT](#about)
- [LICENSE](#license)
- [ENVIRONMENT](#environment)
- [PREPARING](#preparing)
- [HOW TO USE](#how-to-use)
- [ERROR LOG](#error-log)

---

## ABOUT

- [Lang Chain のチュートリアル](https://python.langchain.com/docs/expression_language/get_started) をやってみるための環境構築をしました。
- VSCode の Extensions で Jupyter Notebook を立ち上げ，Docker Container 内の Jupyter サーバーにアクセスして使用します。

---

## LICENSE

---

[un license](./LICENSE)

---

## ENVIRONMENT

- Python: see [Dockerfile](./Dockerfile)
- VSCode with [Jupyter Notebook Extensions](https://marketplace.visualstudio.com/items?itemName=ms-toolsai.jupyter)

---

## PREPARING

- install [Jupyter Notebook Extensions](https://marketplace.visualstudio.com/items?itemName=ms-toolsai.jupyter)
- Buy OpenAi API [here](https://platform.openai.com/account/api-keys)

---

## HOW TO USE

1. edit [.env](./.env) to add your OpenAi API KEY

```shell
cat <<EOF >> .env
OPENAI_API_KEY="hogehoge"
EOF
```
2. run Docker container

```shell
docker compose up
lcel-container  | [I 2024-03-13 04:54:57.732 ServerApp]     http://127.0.0.1:8888/tree?token=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

3. Open [./test.ipybn](./test.ipybn) in VSCode Jupyter Extensions
4. Select Kernel --> Select Another Kernel --> token 付きの URL を docker compose up の標準出力に表示されている URL を入力

---

## ERROR LOG

### raise HTTPError(403, "'\_xsrf' argument missing from POST"

- token を空にすると VSCode の Jupyter の Extension から kernel 指定時に xsrf エラーが出る。

```
# compose.yml
#command: jupyter notebook --ip=0.0.0.0 --port=8888 --allow-root  --NotebookApp.password='' --NotebookApp.token=''
command: jupyter notebook --ip=0.0.0.0 --port=8888 --allow-root  --NotebookApp.password=''
```
