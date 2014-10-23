name              "look_and_feel-tlq"
maintainer        "Ben Dixon"
maintainer_email  "ben@hillsbede.co.uk"
description       "Installs tools to make the server nicer to work on, quite opinionated"
version           "0.0.5"

recipe "look_and_feel-tlq", "Adds visual flag to production environment as well as htop, vim and zip, also allows for the installation of additional locales"

supports "ubuntu"

depends "locales"
