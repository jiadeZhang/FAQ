# redis del
redis-cli -a redis@hl keys "power:*" | xargs redis-cli -a redis@hl del
redis-cli -a redis@hl keys "union_player:*" | xargs redis-cli -a redis@hl del
