public with sharing class LimitsBatch implements Database.Batchable<SObject> {

	public Database.QueryLocator start(Database.BatchableContext BC) {
		return Database.getQueryLocator([SELECT Id FROM AsyncApexJob LIMIT 100]);
	}

	public void execute(Database.BatchableContext BC, List<AsyncApexJob> scope) {
	}

	public void finish(Database.BatchableContext BC) {
		Database.executeBatch(new LimitsBatch(), 1);
	}

}