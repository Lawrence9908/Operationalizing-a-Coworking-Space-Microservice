FROM public.ecr.aws/docker/library/python:3.10-alpine

WORKDIR /app

COPY /analytics/ /app

RUN pip install --no-cache-dir -r /app/requirements.txt

EXPOSE 5000

ENV NAME World

CMD ["python", "app/app.py"]
CMD python app.py
