BUCKET ?= mdn-downloads

upload:
	s3cmd put --recursive buckets/${BUCKET}/ s3://${BUCKET}

open:
	python -m webbrowser "http://${BUCKET}.s3-website-us-west-2.amazonaws.com"

setpolicy:
	s3cmd setpolicy policies/${BUCKET}.json s3://${BUCKET}

setcors:
	s3cmd setcors cors/${BUCKET}.xml s3://${BUCKET}
