
class ApiResponse<Tipo> {
    bool ok;
    String msg;
    Tipo result;

    ApiResponse.ok(this.result){
        ok = true;
    }

    ApiResponse.error(this.msg){
        ok = false;
    }
}