#!/usr/bin/env bash

rm index.html
rm -rf overview/
rm -rf excercies/
rm -rf demonstration/
mkdir -p overview/
mkdir -p excercies/
mkdir -p demonstration/
asciidoctor -r asciidoctor-diagram src/index.adoc -D ./
asciidoctor -r asciidoctor-diagram src/overview/*.adoc -D ./overview/
asciidoctor -r asciidoctor-diagram src/excercies/*.adoc -D ./excercies/
asciidoctor -r asciidoctor-diagram src/demonstration/*.adoc -D ./demonstration/
