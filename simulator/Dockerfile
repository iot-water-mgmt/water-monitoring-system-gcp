FROM python:3.9

ARG app_dir=/app

RUN mkdir $app_dir

WORKDIR $app_dir

ADD https://pki.goog/roots.pem $app_dir

COPY . $app_dir

RUN pip3 install -r requirements.txt

CMD python -u sensor.py \
       --registry_id=$registry_id \
       --cloud_region=$cloud_region \
       --project_id=$project_id \
       --device_id=$device_id \
       --algorithm=RS256 \
       --private_key_file=$private_key_file
