# fandom_app

A new flutter application. It's an fan page app.

## Getting Started
Before start the project, i decide to use MVVM structure.
![mvvm](https://user-images.githubusercontent.com/32385870/113514652-9bf3ea80-9578-11eb-8d65-e91a38a2d9c5.png)

View: manages user intefaces, if AppState is BUSY shows CircuarProgressIndicator(), If not then shows screens(SignInPage, HomePage etc. )

ViewModel: manages AppState, if there is a call for back-end methods(SignInWithEmail() etc.) changes AppState to BUSY, when back-end method returns then changes AppState to IDLE. 

Repository(Model): controls which serivce is used, with this if we decide to change web service or add new one it would be much more easier to implement

Service(Model):Does back-end operations and returns needed data.

## Authentication

Activity Diagram

![auth-uml-diagram](https://user-images.githubusercontent.com/32385870/113706028-d9768600-96e6-11eb-8237-793673d7163a.png)

This diagram only shows sign in process but sign up process is very similar to that. Only changes SignInPage to SignUpPage and signInWithEmail() to signUpWithEmail().
When SignInPage navigates to SignUpPage it firstly goes to RootPage and clear navigation stack before then goes to SignUpPage. So same system works perfectly on sign in process too.

