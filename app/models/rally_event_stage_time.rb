class RallyEventStageTime < ActiveRecord::Base
  # attr_accessible :rally_id, :stage_id, :participant_id, :stage_number, :time
  belongs_to :rally, class_name: 'Rally'
  belongs_to :participant, class_name: 'RallyParticipant'
  belongs_to :stage, class_name: 'RallyStage'

  def self.final_times(rally_id, stage_number = nil, stage_id = nil, class_name = nil)
    if !class_name.nil?
      class_name_query = "AND rally_participants.classification = '#{class_name}'"
      class_name_join = "INNER JOIN rally_participants ON rally_participants.id = rally_event_stage_times.participant_id"
    else
      class_name_query = ""
      class_name_join = ""
    end

    if stage_id.nil?
      find_by_sql("SELECT rally_event_stage_times.participant_id,
      sum(time) as final_time
      FROM rally_event_stage_times
      #{class_name_join}
      WHERE NOT EXISTS(SELECT participant_id FROM rally_event_retirements
      WHERE rally_event_stage_times.participant_id = rally_event_retirements.participant_id
      AND rally_event_retirements.rally_id = #{rally_id.to_i})
      AND rally_event_stage_times.rally_id = #{rally_id.to_i}
      #{class_name_query}
      GROUP by rally_event_stage_times.participant_id
      ORDER BY final_time ASC")
    else
      find_by_sql("SELECT rally_event_stage_times.participant_id,
      sum(time) as final_time
      FROM rally_event_stage_times
      #{class_name_join}
      WHERE NOT EXISTS(SELECT participant_id FROM rally_event_retirements
      WHERE rally_event_stage_times.participant_id = rally_event_retirements.participant_id
      AND rally_event_retirements.rally_id = #{rally_id.to_i}
      AND rally_event_retirements.stage_id = #{stage_id.to_i})
      AND rally_event_stage_times.rally_id = #{rally_id.to_i}
      AND rally_event_stage_times.stage_number <= #{stage_number.to_i}
      #{class_name_query}
      GROUP by rally_event_stage_times.participant_id
      ORDER BY final_time ASC")
    end
  end

  def self.stage_times(rally_id, stage_id, class_name = nil)
    if !class_name.nil?
      class_name_query = "AND rally_participants.classification = '#{class_name}'"
      class_name_join = "INNER JOIN rally_participants ON rally_participants.id = rally_event_stage_times.participant_id"
    else
      class_name_query = ""
      class_name_join = ""
    end
    find_by_sql("SELECT rally_event_stage_times.participant_id,
    sum(time) as final_time
    FROM rally_event_stage_times
    #{class_name_join}
    WHERE NOT EXISTS(SELECT participant_id FROM rally_event_retirements
    WHERE rally_event_stage_times.participant_id = rally_event_retirements.participant_id
    AND rally_event_retirements.rally_id = #{rally_id.to_i}
    AND rally_event_retirements.stage_id = #{stage_id.to_i})
    AND rally_event_stage_times.rally_id = #{rally_id.to_i}
    AND rally_event_stage_times.stage_id = #{stage_id.to_i}
    #{class_name_query}
    GROUP by rally_event_stage_times.participant_id, rally_event_stage_times.stage_id
    ORDER BY final_time ASC")
  end
end
