default: test

test:
	./test-local-cfg.sh

install:
	mkdir -pv /etc/kanata/ ; \
	cp -v ./kanata.kbd /etc/kanata/ ; \
	cp -v ./kanata.service /etc/systemd/system/ ; \

clean:
	rm -rfv /etc/kanata/ /etc/systemd/system/kanata.service


