String messageChecker(Object message)
{
  if(message.runtimeType == String )
  {
    return message as String ;
  }
  else
  {
    message as List ;
    return message.first;
  }
}
