abstract class getstates {}

class getintialstate extends getstates{}
class getchangestate extends getstates{}
class getsuccesstate extends getstates{}
class getfailstate extends getstates{
  final String error;
  getfailstate(this.error);
}