void main()async{

  print( await CreatOrderMessage());

}
Future<String> CreatOrderMessage () async{
  var order= await fetchUserorder();
      return 'your order is : $order';
}
Future<String> fetchUserorder()=>
    Future.delayed(
      const Duration(seconds: 2 ),
        ()=> 'large latte',
    );