#!/usr/bin/env bats
set -e

load env

function setup {
  begin_output
}

function teardown {
  store_output
}

@test "wget" {
  run run_docker_binary "$image" wget --version
  [ $status -eq 0 ]
}

@test "curl" {
  run run_docker_binary "$image" curl --version
  [ $status -eq 0 ]
}

@test "dockerize" {
  run run_docker_binary "$image" dockerize --version
  [ $status -eq 0 ]
}

@test "mysql" {
  run run_docker_binary "$image" mysql --version
  [ $status -eq 0 ]
}

@test "rsync" {
  run run_docker_binary "$image" rsync --version
  [ $status -eq 0 ]
}

@test "wp-cli" {
  run run_docker_binary "$image" wp --version
  [ $status -eq 0 ]
}
