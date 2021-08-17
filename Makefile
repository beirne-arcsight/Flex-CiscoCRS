VERSIONFILE=version.mk

include $(VERSIONFILE)

FLEXFILES = flexagent/syslog/cisco_crs.sdkrfilereader.properties 
CATEGORYFILES =	acp/categorizer/current/cisco/crs.csv

MAPILES =

FLEXTYPE=cisco_crs
ZIPFILE = $(FLEXTYPE)_flex_$(VERSION).zip
DEPZIPFILE = deploy_$(FLEXTYPE)_flex_$(VERSION).zip

all: $(ZIPFILE) $(DEPZIPFILE)
$(ZIPFILE): $(FLEXFILES) $(CATEGORYFILES) $(MAPFILES)
	rm -f $@
	zip $@ $^

$(DEPZIPFILE): $(FLEXFILES)
	rm -f $@
	cd flexagent && zip ../$@ `echo $^ | perl -pe 's#flexagent/##g'`
clean: 
	rm -f $(ZIPFILE)
