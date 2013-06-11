class RallyEventStageTime < ActiveRecord::Base
  # attr_accessible :rally_id, :stage_id, :participant_id, :stage_number, :time
  belongs_to :rally, class_name: 'Rally'
  belongs_to :participant, class_name: 'RallyParticipant'
  belongs_to :stage, class_name: 'RallyStage'

  def self.final_times(rally_id)
    find_by_sql("SELECT rally_event_stage_times.participant_id,
    sum(time) as time, sum(penalty_in_seconds) as penalty_time, (sum(time) + sum(penalty_in_seconds)) as final_time
    FROM rally_event_stage_times
    WHERE NOT EXISTS(SELECT participant_id FROM rally_event_retirements
    WHERE rally_event_stage_times.participant_id = rally_event_retirements.participant_id
    AND rally_event_retirements.rally_id = #{rally_id.to_i})
    AND rally_event_stage_times.rally_id = #{rally_id.to_i}
    GROUP by rally_event_stage_times.participant_id
    ORDER BY final_time ASC")
  end

  def self.stage_times(rally_id, stage_id)
    find_by_sql("SELECT rally_event_split_times.car_id, rally_event_split_times.stage_number, rally_event_split_times.group_id,
    rally_event_split_times.stage_id, rally_event_split_times.season_id, (sum(time) + sum(penalty_in_seconds)) as final_time
    FROM rally_event_split_times
    WHERE NOT EXISTS(SELECT car_id FROM rally_event_retirements
    WHERE rally_event_split_times.car_id = rally_event_retirements.car_id
    AND rally_event_retirements.stage_number = #{stage_number.to_i}
    AND rally_event_retirements.rally_id = #{rally_id.to_i}
    AND rally_event_retirements.season_id = #{season_id.to_i})
    AND rally_event_split_times.stage_id = #{stage_id.to_i}
    AND rally_event_split_times.stage_number = #{stage_number.to_i}
    AND rally_event_split_times.group_id = #{group_id.to_i}
    AND rally_event_split_times.rally_id = #{rally_id.to_i}
    AND rally_event_split_times.season_id = #{season_id.to_i}
    GROUP by rally_event_split_times.car_id, rally_event_split_times.group_id,
    rally_event_split_times.stage_id, rally_event_split_times.season_id, rally_event_split_times.stage_number
    ORDER BY final_time ASC")
  end
end
