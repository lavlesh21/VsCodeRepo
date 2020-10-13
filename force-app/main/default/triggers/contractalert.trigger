trigger contractalert on Contract (before insert,before update) {
    ContractAlertHandler.validationAcc(trigger.new);

    
}