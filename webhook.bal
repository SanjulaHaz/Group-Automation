import ballerinax/trigger.asgardeo;
import ballerina/http;
import ballerinax/scim;

configurable asgardeo:ListenerConfig config = ?;

listener http:Listener httpListener = new(8090);
listener asgardeo:Listener webhookListener =  new(config,httpListener);

scim:ConnectorConfig scimConfig = {
  orgName: "interns",
  clientId: "USeJsCYC2Hz1E3WiSwIAGB5ZYFIa",
  clientSecret : "T1oGNtfQBGbFrWBBLfThw1nrZLVU7klvh6RbF3XZNhQa",
  scope : ["openid"]
};

service asgardeo:RegistrationService on webhookListener {
  
    remote function onAddUser(asgardeo:AddUserEvent event ) returns error? {
      //Not Implemented
    }
    remote function onConfirmSelfSignup(asgardeo:GenericEvent event ) returns error? {
      //Not Implemented
    }
    remote function onAcceptUserInvite(asgardeo:GenericEvent event ) returns error? {
      //Not Implemented
    }
}

service /ignore on httpListener {}