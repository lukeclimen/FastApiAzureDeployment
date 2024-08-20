# Choose the version of Python
FROM python:3.11

# Set up a working directory in the docker container
WORKDIR /code

# Copy just the requestments text file from our local file system into the docker container
COPY ./requirements.txt /code/requirements.txt

# Install the dependencies from the requirements file
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# Copy the code into the working directory
COPY ./app /code/app

# Set the command to use fastapi run, which uses Uvicorn underneath
CMD ["fastapi", "run", "app/main.py", "--port", "80"]