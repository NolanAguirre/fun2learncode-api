# Testing results
The testing results are kind of hard to understand if you don't know how the code is meant to process things, this readme will the complex ones.

All the tests that actually send out emails are commented out, they send emails to my email accounts, please change the email accounts in the testing dump and data.js file to verify these emails sent properly.

The test data is also only valid during march of 2019. Line 29 of begin transaction has a valid date in iso format commented out for testing down the road.

beginTransaction is the only thing effected by the date? I think, only time will tell (pun intended).


## Process process

### THIS TEST MUST BE RUN FIRST
The begin test mutates transaction state, and process is configured to use the transaction state found in the test data dump.

This test will is to test all the fail cases of a given stripe token, your fail cases may vary depending on your stripe rules.

Full testing of process is done in the integration test.

## Begin private
The intended behavior of this is that the user who requested the event has to register before anyone else can.

The user must enroll with a total greater than 0$, as the price is enforced by an override. This is because a user could request a private event, then register a student without the override pricing, meaning that the event would be open to anyone with the link, and the event would be free for everyone.

These tests do not test for invalid private event hashes, as this is testing that = works in postgres.

The client can be "hacked" to send valid event data via the private event route, however this is processed the same as a regular event request...

## Mailing mailing
This should only fail when the database cannot be accessed.



## Refund refund
This tests only for refunds that are granted. Refunds that are not granted are covered by the graphql end point, and will be handled outside of the application via email.

Full testing of refund is done in the integration test.

Refunds fail async, so they always return that they passed at first, webhook is setup to handle the failed ones


MUST USE https://dashboard.ngrok.com/get-started TO TEST WEBHOOK LOCALLY
