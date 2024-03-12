FROM python:3.10 as depencencies

WORKDIR /usr/local/app
COPY ./requirements.txt ./
RUN <<EOF
pip install --upgrade pip setuptools wheel --no-cache-dir
pip install -r ./requirements.txt --no-cache-dir
pip install jupyter
rm /usr/local/app/requirements.txt
EOF

FROM depencencies AS app
COPY . .
