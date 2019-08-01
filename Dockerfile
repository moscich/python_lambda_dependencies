FROM moscich/python_aws_lambda:1.0

COPY requirements.txt /app/
COPY template.yaml /app/
WORKDIR /app
RUN sam build
RUN apk --no-cache add zip
#RUN mv .aws-sam/build/CreditScoring/* .

CMD rm lambda.zip
CMD mv .aws-sam/build/CreditScoring/* .
CMD zip -r9 lambda.zip .