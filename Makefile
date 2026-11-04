PY = $(shell which python3)
PSPDEV = $(shell psp-config --pspdev-path)
CFWSDK = $(PSPDEV)/share/psp-cfw-sdk
PSPGZ = $(CFWSDK)/build-tools/gz/pspgz.py
KHDR = $(CFWSDK)/build-tools/gz/SystemControl.hdr
UHDR = $(CFWSDK)/build-tools/gz/UserModule.hdr

FLASH0 ?= ./build/flash0

all: _prep _galaxy _idcanager _march33 _nidresolver _march33 _popcorn _satelite _systemctrl _vshctrl

_prep:
	mkdir -p FLASH0/kd/
	mkdir -p FLASH0/vsh/module

_galaxy:
	make -C galaxy clean
	make -C galaxy
	cp galaxy/galaxy.prx FLASH0/kd/m33_galaxy.prx
	make -C galaxy clean

_idcanager:
	make -C idcanager clean
	make -C idcanager
	cp idcanager/idcanager.prx FLASH0/kd/m33_idcanager.prx
	make -C idcanager clean

_march33:
	make -C march33 clean
	make -C march33
	cp march33/march33.prx FLASH0/kd/m33_march33.prx
	make -C march33 clean

_nidresolver:
	make -C nidresolver clean
	make -C nidresolver
	cp nidresolver/nidresolver.prx FLASH0/kd/m33_nidresolver.prx
	make -C nidresolver clean

_popcorn:
	make -C popcorn clean
	make -C popcorn
	cp popcorn/popcorn.prx FLASH0/kd/m33_popcorn.prx
	make -C popcorn clean

_satelite:
	make -C satelite clean
	make -C satelite
	cp satelite/satelite.prx FLASH0/vsh/module/m33_satelite.prx
	make -C satelite clean

_systemctrl:
	make -C systemctrl clean
	make -C systemctrl
	cp systemctrl/systemctrl.prx FLASH0/kd/m33_systemctrl.prx
	make -C systemctrl clean

_vshctrl:
	make -C vshctrl clean
	make -C vshctrl
	cp vshctrl/vshctrl.prx FLASH0/kd/m33_vshctrl.prx
	make -C vshctrl clean

clean:
	rm -rf FLASH0
	make -C galaxy clean
	make -C idcanager clean
	make -C march33 clean
	make -C nidresolver clean
	make -C popcorn clean
	make -C satelite clean
	make -C systemctrl clean
	make -C vshctrl clean