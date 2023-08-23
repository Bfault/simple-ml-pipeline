FROM hashicorp/terraform:1.5.5

WORKDIR /app

COPY . .

ENTRYPOINT ["/bin/sh", "-c"]
RUN terraform init -input=false