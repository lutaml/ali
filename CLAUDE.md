# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is the `ali` Ruby gem — an implementation of the [NISO Access and License Indicators (ALI) Schemas](https://www.niso.org/schemas/ali/1.0) (NISO RP 22-2021). It parses and generates ALI data in both XML and JSON-LD formats. The gem is used by the `niso-jats` gem.

## Commands

- **Run all tests and lint:** `bundle exec rake` (default task runs `spec` then `rubocop`)
- **Run tests only:** `bundle exec rspec`
- **Run a single test file:** `bundle exec rspec spec/ali/free_to_read_spec.rb`
- **Run a single test by line:** `bundle exec rspec spec/ali/free_to_read_spec.rb:15`
- **Lint only:** `bundle exec rubocop`

## Architecture

All model classes inherit from `Lutaml::Model::Serializable` (from the `lutaml-model` gem) and declare attributes + XML/JSON mappings using its DSL.

- **`Ali::FreeToRead`** — `free_to_read` element. Attributes: `start_date` (date), `end_date` (date).
- **`Ali::LicenseRef`** — `license_ref` element. Attributes: `start_date` (date), `applies_to` (string), `uri` (string, mapped from XML text content).
- **`Ali::Container`** — Root container for JSON-LD usage only (not part of the NISO ALI spec). Contains collections of `FreeToRead` and `LicenseRef`.

XML namespace for all elements: `http://www.niso.org/schemas/ali/1.0/`

The adapter configuration (Nokogiri for XML, standard library for JSON/YAML) is set up in `spec/spec_helper.rb`.

## Key Details

- `LicenseRef#uri` is mapped from XML element *content* (`map_content`), not an attribute.
- XML tests use `be_xml_equivalent_to` (from `lutaml-model`) for XML comparison; JSON tests use `eq` on strings.
- Ruby >= 3.0.0 required.
- CI uses reusable workflows from `metanorma/ci` (generic-rake, rubygems-release).
