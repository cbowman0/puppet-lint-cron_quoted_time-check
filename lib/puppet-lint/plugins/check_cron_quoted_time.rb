# Public: Check the tokens of each Cron resource instance for the time
# parameters and if found, record a warning if the value of that parameter is
# not a quoted string.
PuppetLint.new_check(:cron_quoted_time) do
  CRON_TOKEN_TYPES = Set[:NUMBER]

  def check
    resource_indexes.each do |resource|
      if resource[:type].value == "cron"
        resource[:param_tokens].select { |param_token|
          ['hour', 'minute', 'month', 'monthday', 'weekday'].include?(param_token.value) &&
            CRON_TOKEN_TYPES.include?(param_token.next_code_token.next_code_token.type)
        }.each do |param_token|
          value_token = param_token.next_code_token.next_code_token
          notify :warning, {
            :message => 'unquoted cron time',
            :line    => value_token.line,
            :column  => value_token.column,
            :token   => value_token,
          }
        end
      end
    end
  end

  def fix(problem)
    problem[:token].type = :SSTRING
  end
end
