FROM python:3.9.2-alpine

ENV PYTHONUNBUFFERED=TRUE

ADD .mbs-deps/python_native_app/python_native_app.pyz /app.pyz

ENTRYPOINT [ "/app.pyz" ]
