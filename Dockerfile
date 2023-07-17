FROM python:3-slim

WORKDIR /usr/src/app

COPY . .

RUN pip install virtualenv 
RUN virtualenv -p $(which python3) venv
ENV PATH="venv/bin:$PATH"
RUN pip install -r requirements.txt

EXPOSE 8080

CMD ["./venv/bin/python", "./harsanitizer/harsan_api.py"]
