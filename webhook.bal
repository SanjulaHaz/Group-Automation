import ballerinax/trigger.asgardeo;
import ballerina/http;
import ballerina/io;
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

public function getUserDetails() returns error?{
  scim:Client client1 = check new(scimConfig);
  scim:UserResource response= check client1->getUser("0ffc0ff3-6f56-46fe-8419-c36dd27e1936");
  io:println("User Details: ",response);
}

service /ignore on httpListener {}