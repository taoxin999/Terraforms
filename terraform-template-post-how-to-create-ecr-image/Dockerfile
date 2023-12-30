FROM public.ecr.aws/lambda/python:3.8

# Install the function's dependencies using file requirements.txt
COPY requirements.txt ./
RUN pip3 install -r requirements.txt

# RUN pip install requests
RUN pip install oracledb
RUN pip install boto3

COPY src/main.py ./
# COPY main.py ./

# Set the CMD to your handler
# (could also be done as a parameter override outside of the Dockerfile)
# CMD ["myfunction.lambda_handler"]
CMD ["main.lambda_handler"]

