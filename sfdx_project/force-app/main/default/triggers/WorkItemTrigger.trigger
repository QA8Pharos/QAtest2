trigger WorkItemTrigger on CustomObj__c (before insert) { 
   for(CustomObj__c newWorkItem : Trigger.New) { 
      for(CustomObj__c oldWorkItem : Trigger.Old) { 
         if(newWorkItem.Date__c == oldWorkItem.Date__c){ 
            newWorkItem.addError('No pueden haber 2 Work Items con titulos iguales.');
         }
      } 
   } 
}