trigger Accounttrigger on Account (after update) {
       
    Map<Id,Id> map1;// = new Map<Id,Id>();
    try{
        for(Account a : Trigger.new) {
            //AccountHelper.updateAccountFields(a, Trigger.oldMap.get(a.Id));
            if(a.Site == Trigger.oldMap.get(a.Id).Site) {
                map1.get(a.Id);
            }
            a.Rating = a.Rating + '11';
        }
    }
    catch(Exception e){
        //Log.instance.error(Log.Area.OpportunityManagement, e);
    }



    List<Account> newAs = Trigger.new;
    for(Account a : newAs) {
        Account oldA = (Account)Trigger.oldMap.get(a.Id);
        if(oldA.Website != a.Website) {
            a.addError('Trigger after update error');
            a.Parent.Name = 'asdasd';
        }
        
    }
    List<AggregateResult> lastLogWithHash1 = [
        SELECT MIN(pharos__First_Occurred_On__c) minCreatedDate, pharos__Hash_1__c hash1 
        FROM pharos__Log__c where pharos__hash_1__c IN ('2Y3WoFEJR1ODG5RouLkN5k/BhdKoo+IF8gz4dA/iJgg=', null) 
        GROUP BY pharos__Hash_1__c limit 2
        ];
        system.debug('---lastLogWithHash1--'+lastLogWithHash1);
   
        
}