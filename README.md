#The Fake tower.im


Tech Stack
-----------

* Back-end:

  * Rails: Version 3.2.13
  * Ruby: 2.0.0
  * Mongo: Back-end document-oriented database.
  * Node.js & Socket.io: Real time chat
  * Redis: bald message queue(no Resque or Sidekiq)
  * Devise: Permission control.
  * Rspec & Factory-girls: For testing.

* Front-end:

  * Bootstrap: Layout.
  * Angularjs: Front-end MVC.
  * simple_form: To generate programmer-friendly form code.

How it works
------

1. Clone the repo
2. Ensure RVM, NVM, mongodb and redis are installed
3. Test command: <code>$ rake spec:controllers</code>
4. Launch the db:
  ```
  $ mongod && redis-server
  ```
5. Open the socket: ```$ cd node-broadcast && npm install && node.server.js```

6. Bundle install and start the rail server

-------
Well, it's only a fake tower.im. <del>The app would be deployed to Heroku after half-assed finished.<del>

License
---------
Fake tower is released under the MIT License.