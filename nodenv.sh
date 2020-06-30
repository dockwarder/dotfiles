#!/bin/bash

nodenv install 12.18.1
nodenv rehash
nodenv global 12.18.1

npm i -g vercel serve @angular/cli gatsby-cli @vue/cli