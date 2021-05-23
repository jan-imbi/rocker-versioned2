FROM janmeisimbi/imbir:production

RUN apt-get update && apt-get install -y acl \
	iputils-ping

CMD ["/init"]