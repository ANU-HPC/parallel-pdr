#ifndef EXCEPTIONS
#define EXCEPTIONS

#include <exception>
#include <string>

/*class myexception: public std::exception
{
  virtual const char* what() const throw()
  {
    return "My exception happened";
  }
} myex;*/

class BufferAllocException : public std::exception
{
  std::string m_msg;
public:
  BufferAllocException(const std::string& file_name) : m_msg(std::string("Buffer Allocate Exception ") + file_name) {}
  virtual const char* what() const throw()
  {return m_msg.c_str();}
};

class FileFailedException : public std::exception
{
  std::string m_msg;
public:
  FileFailedException(const std::string& file_name) : m_msg(std::string("Failed to load: ") + file_name) {}
  virtual const char* what() const throw()
  {return m_msg.c_str();}
};

class ParsingException : public std::exception
{
  std::string m_msg;
public:
  ParsingException(const std::string& file_name)
 : m_msg(std::string("Parsing File Failed: ") + file_name) {}
  virtual const char* what() const throw()
  {return m_msg.c_str();}
};

class ConsistencyException : public std::exception
{
  std::string m_msg;
public:
  ConsistencyException(const std::string& file_name)
 : m_msg(std::string("Dagster is made Inconsitent: ") + file_name) {}
  virtual const char* what() const throw()
  {return m_msg.c_str();}
};

class BadInitialisationException : public std::exception
{
  std::string m_msg;
public:
  BadInitialisationException(const std::string& file_name)
 : m_msg(std::string("Dagster has a problem initialising: ") + file_name) {}
  virtual const char* what() const throw()
  {return m_msg.c_str();}
};

class BadParameterException : public std::exception
{
  std::string m_msg;
public:
  BadParameterException(const std::string& file_name)
 : m_msg(std::string("Bad parameter in Dagster: ") + file_name) {}
  virtual const char* what() const throw()
  {return m_msg.c_str();}
};

class UnitClauseConflictException : public std::exception
{
  std::string m_msg;
public:
  UnitClauseConflictException(const std::string& file_name)
 : m_msg(std::string("SatSolver has conflict in Unit clauses: ") + file_name) {}
  virtual const char* what() const throw()
  {return m_msg.c_str();}
};




#endif
