NPM=npx
NPMDEPS=$(node_modules)

$(NPM): $(NPMDEPS)
	set PERCY_TOKEN=2ceb53f1e4f2994ae343e354781ab7307d226fd8941ce0b245fe439784692a0d
	export NODE_TLS_REJECT_UNAUTHORIZED=0

.PHONY: npm install clean serve test

install: $(NPM)

clean:
	rm -rf $$(cat .gitignore)

serve:
	mvn package
	java -cp target/example-percy-java-selenium-1.0-SNAPSHOT.jar io.percy.examplepercyjavaselenium.App

test: install
	$(NPM) percy exec -- mvn clean test
