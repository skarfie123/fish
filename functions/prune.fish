function prune
  docker system prune --volumes $argv
  docker volume prune --all $argv
  docker network prune $argv
  docker image prune --all $argv
end
