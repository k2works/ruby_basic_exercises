#!/usr/bin/env bash

mkdir -p dist/overview/
mkdir -p dist/excercies/
mkdir -p dist/demonstration/
asciidoctor -r asciidoctor-diagram src/index.adoc -D dist/
cp -r src/overview/PITCHME.md dist/overview/PITCHME.md
asciidoctor -r asciidoctor-diagram src/overview/*.adoc -D dist/overview/
asciidoctor -r asciidoctor-diagram src/excercies/*.adoc -D dist/excercies/
asciidoctor -r asciidoctor-diagram src/demonstration/*.adoc -D dist/demonstration/
