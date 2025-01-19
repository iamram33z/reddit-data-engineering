# Use the official Apache Airflow image with Python 3.12
FROM apache/airflow:2.7.1-python3.12

# Copy the requirements file to the specified directory in the container
COPY requirements.txt /opt/airflow/

# Switch to the root user to install system dependencies
USER root

# Update the package list and install necessary system dependencies
RUN apt-get update && apt-get install -y gcc python3-dev

# Switch back to the airflow user
USER airflow

# Install Python dependencies from the requirements file
RUN pip install --no-cache-dir -r /opt/airflow/requirements.txt