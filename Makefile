REBAR = $(shell pwd)/rebar3
.PHONY: compile rel

DIALYZER_APPS = kernel stdlib erts sasl eunit syntax_tools compiler crypto

all: compile

test: common_test

clean:
	$(REBAR) clean

common_test:
	$(REBAR) ct

compile:
	$(REBAR) compile

rel:
	$(REBAR) release

stage:
	$(REBAR) release -d

DIALYZER_APPS = kernel stdlib sasl erts ssl tools os_mon runtime_tools crypto inets \
	xmerl webtool eunit syntax_tools compiler mnesia public_key snmp

include tools.mk

typer:
	typer --annotate -I ../ --plt $(PLT) -r src
