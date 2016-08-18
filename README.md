# Elixir Build Base Images
[![Build Status](https://drone.element-43.com/api/badges/EVE-Tools/elixir-build-base/status.svg)](https://drone.element-43.com/EVE-Tools/elixir-build-base)

This repository contains the Dockerfile for the build container of Element43's Elixir-based projects. It includes packages such as Erlang, Elixir itself and the necessary compilers for compiling binary dependencies before bundling them up for release. This container is automatically built and published to Docker Hub by Drone. Containers are tagged with the branch's name.
