MAX_TEX_RECURSION=4

XML_DECL=/usr/share/xml/declaration/xml.dcl
#        /usr/lib/sgml/declaration/xml.dcl

HTML_SS=/usr/lib/sgml/stylesheet/dsssl/docbook/nwalsh/html/docbook.dsl
#/usr/share/doc/docbook-dsssl/examples/html-siteconfig.dsl

#/usr/share/sgml/docbook/stylesheet/dsssl/ldp/ldp.dsl

PRINT_SS=/usr/lib/sgml/stylesheet/dsssl/docbook/nwalsh/print/docbook.dsl
#/usr/share/doc/docbook-dsssl/examples/print-siteconfig.dsl


all: myfrdcsa-manual

myfrdcsa-manual: myfrdcsa-manual.ps myfrdcsa-manual.txt myfrdcsa-manual.html

myfrdcsa-manual.tex: myfrdcsa-manual.xml
	jade -t tex -V tex-backend \
		-d $(PRINT_SS) \
		$(XML_DECL) $<

myfrdcsa-manual.dvi: myfrdcsa-manual.tex
	# Trick from Adam Di Carlo <adam@onshore.com> to recurse jadetex
	# "just enough".
	-cp -pf prior.aux pprior.aux
	-cp -pf $(shell basename $< .tex).aux prior.aux
	jadetex $<
	if ! cmp $(shell basename $< .tex).aux prior.aux &&	     \
	   ! cmp $(shell basename $< .tex).aux pprior.aux &&	    \
	   expr $(MAKELEVEL) '<' $(MAX_TEX_RECURSION); then	     \
		rm -f $@						;\
		$(MAKE) $@					      ;\
	fi
	rm -f prior.aux pprior.aux

myfrdcsa-manual.ps: myfrdcsa-manual.dvi
	dvips -f $< > $@

myfrdcsa-manual.html: myfrdcsa-manual.xml
	jade -t sgml \
		-d $(HTML_SS) \
		$(XML_DECL) $<

myfrdcsa-manual.txt: myfrdcsa-manual.xml
	jade -t sgml -V nochunks \
		-d $(HTML_SS) \
	$(XML_DECL) $< > dump.html
	lynx -force_html -dump dump.html > $@
	-rm -f dump.html

validate:
	nsgmls -s -wxml $(XML_DECL) myfrdcsa-manual.xml

clean:
	rm -f *.html *.aux *.log *.dvi *.ps *.tex *.txt

myfrdcsa-manual.htm:
	jade -t sgml \
		-d /usr/share/sgml/docbook/stylesheet/dsssl/modular/html/docbook.dsl \
	$(XML_DECL) myfrdcsa-manual.xml $<		

ldpps:
	/usr/bin/dvips -o myfrdcsa-manual.ps myfrdcsa-manual.dvi
