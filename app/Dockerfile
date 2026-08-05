FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

RUN groupadd appgroup && \
    useradd -m -g appgroup appuser

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY src ./src

RUN chown -R appuser:appgroup /app

USER appuser

EXPOSE 8080

HEALTHCHECK \
--interval=30s \
--timeout=5s \
--start-period=10s \
--retries=3 \
CMD curl --fail http://localhost:8080/health || exit 1

CMD ["gunicorn","-w","4","-b","0.0.0.0:8080","src.app:app"]