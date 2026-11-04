default: check

test: check
	./test-local-cfg.sh

check:
	kanata -c ./kanata.kbd --check

install:
	mkdir -pv /etc/kanata/ ; \
	cp -v ./kanata.kbd /etc/kanata/ ; \
	cp -v ./kanata.service /etc/systemd/system/ ; \

clean:
	rm -rfv /etc/kanata/ /etc/systemd/system/kanata.service


