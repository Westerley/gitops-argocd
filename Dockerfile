FROM python:3

RUN pip install mkdocs

WORKDIR /app

COPY ./app/ /app/

EXPOSE 8000

ENTRYPOINT ["mkdocs"]

CMD ["serve", "--dev-addr=0.0.0.0:8000"]