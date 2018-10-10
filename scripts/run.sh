#!/bin/sh

PKI=${TASKDDATA}/pki
mkdir -p ${PKI}

# Create vars file according to environment
cat > ${TASKDDATA}/pki/vars <<EOF
BITS=${TASKD_BITS:-4096}
EXPIRATION_DAYS=${TASKD_EXPIRATION:-365}
CN="${TASKD_CN:-localhost}"
ORGANIZATION="${TASKD_ORGANIZATION}"
COUNTRY="${TASKD_COUNTRY}"
STATE="${TASKD_STATE}"
LOCALITY="${TASKD_LOCALITY}"
EOF

# Generate certificates
if ! test -e ${TASKDDATA}/config; then
	taskd init
	taskd config --force log /dev/stdout

	cp /usr/share/taskd/pki/generate* ${PKI}
	sh /scripts/generate_certs.sh

	taskd config --force "client.cert" "${PKI}/client.cert.pem"
	taskd config --force "client.key" "${PKI}/client.key.pem"
	taskd config --force "server.cert" "${PKI}/server.cert.pem"
	taskd config --force "server.key" "${PKI}/server.key.pem"
	taskd config --force "server.crl" "${PKI}/server.crl.pem"
	taskd config --force "ca.cert" "${PKI}/ca.cert.pem"

	taskd config --force server "0.0.0.0:53589"
fi

# Start taskd server
taskd server --data ${TASKDDATA}
