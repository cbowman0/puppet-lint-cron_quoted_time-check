# Public: Check the tokens of each File resource instance for a mode
# parameter and if found, record a warning if the value of that parameter is
# not a quoted string.
PuppetLint.new_check(:unquoted_cron_time) do

  def check
    resource_indexes.each do |resource|
      if resource[:type].value == "cron"
        resource[:param_tokens].select { |param_token|
          ['hour', 'minute'].include?(param_token.value) &&
            TOKEN_TYPES.include?(param_token.next_code_token.next_code_token.type)
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