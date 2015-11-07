json.rounds @rounds do |round|
  json.round_id round.id
  if (round.start_time >= Time.now) then json.status 0
  elsif (round.bet_time > Time.now) then json.status 1
  elsif (round.end_time > Time.now) then json.status 2
  else json.status 3 end
  json.start_time round.start_time
end
