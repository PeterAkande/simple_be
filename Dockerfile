FROM --platform=linux/amd64 python:3.11.9

# Set the working directory
WORKDIR /app

COPY . /app

RUN ls 

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

RUN python -c "import os; print(os.environ)"

# Expose the port
EXPOSE 8000

# Run the application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]