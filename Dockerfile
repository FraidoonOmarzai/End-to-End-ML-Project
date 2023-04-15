FROM python:3.7
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
# Set the environment variables
ENV FLASK_APP=app.py
ENV FLASK_ENV=development
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=5000
EXPOSE 5000
CMD ["flask", "run"]