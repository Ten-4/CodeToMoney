json.rounds @rounds do |round|
  json.round_id round.id
  json.time Time.now.to_f
  json.start_time round.start_time.to_f
  json.joined @joined_ids.include?(round.id)
end
