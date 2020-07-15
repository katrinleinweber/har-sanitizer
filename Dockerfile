FROM python:3

WORKDIR /usr/src/app

COPY . .

RUN pip install virtualenv 
RUN virtualenv -p $(which python2.7) venv
ENV PATH="venv/bin:$PATH"
RUN pip install -r requirements.txt

EXPOSE 8080

CMD ["python", "./harsanitizer/harsan_api.py"]