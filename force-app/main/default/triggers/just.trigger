trigger just on Account (after insert) {
    for(account acc: trigger.new)
    {
       // batchforxml ab = new batchforxml();
//database.executeBatch(ab);

        ClassWithFuture ab= new ClassWithFuture();

    }

}