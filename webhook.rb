def create_echo_response(request)  
  return {
    response: {
      text: request['request']['original_utterance'],
      tts: request['request']['original_utterance'],
      end_session: false
    },
    session: {
      user_id: request["session"]["user_id"],
      session_id: request["session"]["session_id"],
      message_id: request["session"]["message_id"]
    },
    version: request["version"]
  }
end

def webhook(event:, context:)
  request_message = JSON.parse(event["body"])
  response_message = create_echo_response(request_message)
  return {
    statusCode: 200,
    body: JSON.generate(response_message)
  }
end
