PREFIX ?= /usr/local

.PHONY : all
all: adi-diagnostic-report.desktop

%.desktop: %.desktop.in
	sed 's/@PREFIX@/$(subst /,\/,$(PREFIX))/' $+ > $@

.PHONY : clean
clean:
	rm -f adi-diagnostic-report.desktop

install: all
	install -d $(DESTDIR)$(PREFIX)/bin
	install -d $(DESTDIR)$(PREFIX)/share/adi_diagnostic_report/
	install ./adi_diagnostic_report $(DESTDIR)$(PREFIX)/bin/
	install ./adi_diagnostic_report.glade $(DESTDIR)$(PREFIX)/share/adi_diagnostic_report/
	xdg-desktop-menu install adi-diagnostic-report.desktop

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/adi_diagnostic_report
	rm -rf $(DESTDIR)$(PREFIX)/share/adi_diagnostic_report/
	xdg-desktop-menu uninstall adi-diagnostic-report.desktop

