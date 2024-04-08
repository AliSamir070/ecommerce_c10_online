import 'Data.dart';

/// results : 54
/// data : [{"_id":"64089fe824b25627a25315d1","name":"Canon","slug":"canon","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678286824747.png"}]

class TestEntityResponse {
  TestEntityResponse({
      this.results, 
      this.data,});

  int? results;
  List<Data>? data;


}