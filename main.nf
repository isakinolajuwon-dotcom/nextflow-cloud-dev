name: Nextflow CI

on:
  push:
    branches: [ main, dev ]
  pull_request:
    branches: [ main ]

jobs:
  run-pipeline:
    runs-on: ubuntu-latest

    steps:
      # Step 1: Check out the repository code
      - name: Checkout Code
        uses: actions/checkout@v4

      # Step 2: Set up Java (Nextflow requires Java 11 or higher)
      - name: Setup Java
        uses: actions/setup-java@v4
        with:
          distribution: 'temurin'
          java-version: '17'

      # Step 3: Set up Nextflow using nf-core's helper action
      - name: Setup Nextflow
        uses: nf-core/setup-nextflow@v3
        with:
          version: 'latest-stable'

      # Step 4: Execute Nextflow
      - name: Run Pipeline Tests
        run: |
          nextflow run main.nf -profile test
