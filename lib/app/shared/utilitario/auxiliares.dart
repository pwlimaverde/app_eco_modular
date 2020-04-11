
convertMes(String mes){
  String result;
  if(mes == "jan"){
    result = "01";
  }else if(mes == "fev"){
    result = "02";
  }else if(mes == "mar"){
    result = "03";
  }else if(mes == "abr"){
    result = "04";
  }else if(mes == "mai"){
    result = "05";
  }else if(mes == "jun"){
    result = "06";
  }else if(mes == "jul"){
    result = "07";
  }else if(mes == "ago"){
    result = "08";
  }else if(mes == "set"){
    result = "09";
  }else if(mes == "out"){
    result = "10";
  }else if(mes == "nov"){
    result = "11";
  }else{
    result = "12";
  }
  return result;
}