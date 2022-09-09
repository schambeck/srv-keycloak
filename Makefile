APP = srv-keycloak
STACK_CONF = docker-stack.yml
DOCKER_IMAGE = ${APP}:latest

# Docker

docker-build-deploy: docker-build stack-deploy

docker-build-push: docker-build docker-push

docker-build:
	docker build -t ${DOCKER_IMAGE} .

docker-push:
	docker push ${DOCKER_IMAGE}

docker-run:
	docker run -p 9000:9000 \
		--name ${APP} \
		--network schambeck-net \
		-e KC_HTTP_PORT=9000 \
		-e KEYCLOAK_ADMIN=admin \
		-e KEYCLOAK_ADMIN_PASSWORD=admin \
		${DOCKER_IMAGE}

# Swarm

stack-deploy:
	docker stack deploy -c ${STACK_CONF} --with-registry-auth ${APP}

stack-rm:
	docker stack rm ${APP}

service-logs:
	docker service logs ${APP}_web -f

# LDAP

ldap-search-users:
	ldapsearch -x \
		-b "ou=users,dc=schambeck,dc=com" \
		-H ldap://localhost:1389 \
		-D "cn=admin,dc=schambeck,dc=com" \
		-W \
		"objectClass=inetOrgPerson"
