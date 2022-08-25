FROM apache/airflow:2.3.3

USER root

RUN apt-get update  \
    && apt-get install -y --no-install-recommends vim \
    && apt-get autoremove -yqq --purge \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt ./

USER airflow

RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt


