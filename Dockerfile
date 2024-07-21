# Use the official Python image from the Docker Hub, specifying version 3.12.0
FROM python:3.12.0

# Set the working directory inside the container to /app
WORKDIR /app

# Install Poetry, a dependency management tool for Python
RUN curl -sSL https://install.python-poetry.org | python3 -

# Add Poetry to the PATH environment variable
ENV PATH="/root/.local/bin:$PATH"

# Copy the pyproject.toml and poetry.lock files to the working directory
COPY pyproject.toml* poetry.lock* ./

# Configure Poetry to create virtual environments inside the project directory
RUN poetry config virtualenvs.create false --local \
    && poetry config virtualenvs.in-project false --local

# Install the dependencies listed in pyproject.toml, if the file exists
RUN if [ -f pyproject.toml ]; then poetry install --no-root; fi


# Set the default command to run the application using Uvicorn, an ASGI server
CMD ["poetry", "run", "uvicorn", "api.main:app", "--host", "0.0.0.0", "--reload"]
