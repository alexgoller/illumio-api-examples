#!/usr/bin/env python3

#----------------------------------------------------------------
# Script to dump user info for each instance on Demo10 (the 
# demo system for Illumio partners)
#
# The credentials for the admin account have been removed, so this 
# is really just an example showing how to login and use the API
#----------------------------------------------------------------

import certifi
import requests
import os
import time
import sys

# use the certs from the certifi package, to avoid TLS errors
# for some reason, this doesn't happen automatically
os.environ.setdefault('REQUESTS_CA_BUNDLE', certifi.where())

# error handling
def fatalError(str):
    print("Error: " + str)
    sys.exit(-1)
 
# dump info about every org in Demo10
def main():
    for id in range(1,100):
        checkOrg(id)
        
        # pause between orgs, to avoid being rate limited
        sys.stdout.flush()
        time.sleep(5)
    return
    
# dump the user info for one of the instances on Demo10    
def checkOrg(orgid):
    username = "adminuser@acme.com"
    password = "H@rdT0GuE55!"
    
    # connect to the PCE  
    pce = PCE("demo10.illum.io", orgid)
    pce.login(username, password);
    #pce.healthcheck()
    
    # dump info for all local users
    allusers = pce.getUserInfo()
    count = 0;
    for user in allusers:
        if (user['type'] == 'local'):
            # skip the example users that are in every instance
            name = user['username'] 
            if name.startswith('script_demo_') or name.startswith('labuser+'):
                continue
            
            # extract the date part of the last login timestamp
            lastlogin = user['last_login_on']
            if lastlogin:
                lastlogin = lastlogin.split('T')[0]
                
            print(orgid, user['full_name'], user['username'], lastlogin, user['login_count'], sep=',')
            count += 1

    if not count:
        print(orgid)
    
    # logout
    pce.logout()
    return
      
# class to abstract the PCE API interactions    
class PCE :
    def __init__(self, fqdn, org):
        self.fqdn = fqdn
        self.org  = str(org)
        
        self.session = requests.Session()
    
    def apiRoot(self):
        return "https://" + self.fqdn + "/api/v2"

    def apiURL(self, api):
        url = self.apiRoot() + "/" + api
        #print(url)        
        return url
        
    def orgApiURL(self, api):
        url = self.apiRoot() + "/orgs/" + self.org + "/" + api
        #print(url)        
        return url
    
    def login(self, username, password):        
        # get an auth token 
        r = self.session.post( \
            url=self.apiURL('login_users/authenticate'), \
            params={'pce_fqdn' : self.fqdn}, \
            auth=(username, password)) 
        
        if r.status_code == 429:
            fatalError("too many requests - retry after " + r.headers['Retry-After'])
        elif r.status_code != 201:
            fatalError("failed to get auth token - " + r.reason)
    
        auth_token = r.json()['auth_token']
        
        # use the auth token to login and get a session token
        r = self.session.get( \
            url=self.apiURL('users/login'), \
            headers={ 'Authorization' : 'Token token=' + auth_token })
 
        session_token = r.json()['session_token']
        auth_username = r.json()['auth_username']
         
        # setup authentication for this session
        self.session.auth = (auth_username, session_token)
        
        # remember the user id number, to use in API calls
        self.userid  = r.json()['href'][1:]
        return

    def logout(self):        
        r = self.session.put( \
            url=self.apiURL(self.userid + '/logout'), \
            data="{}" , headers={ 'Content-Type' : 'application/json' })
        
        if r.status_code != 204:
            fatalError("logout failed - " + r.reason)
            
        return

    # call a simple GET API and return the JSON structure sends back
    def simpleGetAPI(self, api):
        r = self.session.get(url=self.apiURL(api))        
        if r.status_code != 200:
            fatalError(api + " API access failed - " + r.reason)
        return r.json()    
    
    # run the healthcheck API & print the results
    def healthcheck(self):  
        info = self.simpleGetAPI('health')
        print(info)
        return
    
    # get a list of all users
    def getUserInfo(self):
        info = self.simpleGetAPI('users')        
        return info    

# call the main function
if __name__ == "__main__":
    main()
    