# fandom_app

A new Flutter application. It's an fan page app.

minSdkVersion 16

targetSdkVersion 29

## Structure
Before start the project, i decide to use MVVM with repository structure.
![mvvm](https://user-images.githubusercontent.com/32385870/113514652-9bf3ea80-9578-11eb-8d65-e91a38a2d9c5.png)

View: manages user intefaces, if AppState is BUSY shows CircuarProgressIndicator(), If not then shows screens(SignInPage, HomePage etc. )

ViewModel: manages AppState, if there is a call for back-end methods(SignInWithEmail() etc.) changes AppState to BUSY, when back-end method returns then changes AppState to IDLE. 

Repository(Model): controls which serivce is used, with this if we decide to change web service or add new one it would be much more easier to implement

Service(Model):Does back-end operations and returns needed data.

## Views

### Sign In
![sign in](https://user-images.githubusercontent.com/32385870/163370067-5b18348c-249b-494d-b485-4733550620a7.png)
### Sign Up
![sign up](https://user-images.githubusercontent.com/32385870/163370283-5f59d4bf-ca2b-4403-8a8d-41533a2edc93.png)
### Home Page
Home Page shows news and announcements about the application

![home page](https://user-images.githubusercontent.com/32385870/163370519-61d27eb3-0288-4257-9819-6fa5d59c077d.png)
### Navigation Bar
![navbar](https://user-images.githubusercontent.com/32385870/163370773-edfee299-7a44-42bb-a161-f5652d365fdc.png)
### Profile
In Profile Page we can access our recent activities and fandom memberships

![profile](https://user-images.githubusercontent.com/32385870/163371114-ec879250-fc35-42eb-bfd9-a12ca714dc9e.png)
### Fandoms
Shows list of all fandoms

![all fandoms](https://user-images.githubusercontent.com/32385870/163371621-89a11771-66a0-433f-b499-b7b68ecc0f4b.png)
### A Fandom Page
In a fandom page we can see description of the fandom and announcements.

![inside fandom](https://user-images.githubusercontent.com/32385870/163371759-788e1568-8824-48a1-825b-2564edd17df0.png)
![inside fandom2](https://user-images.githubusercontent.com/32385870/163372034-0b079bfb-0041-469c-bf9f-32f050431ec9.png)
![inside fandom3](https://user-images.githubusercontent.com/32385870/163373068-cfa4e2e9-8a54-4c4e-a3d2-15f65bb92861.png)

With Floating Action Button at the bottom left corner we can see information pages of the fandom

![fandom pages](https://user-images.githubusercontent.com/32385870/163376641-4cee374b-e13f-4ac0-b72f-1561387516f7.png)
![pages more](https://user-images.githubusercontent.com/32385870/163376658-7070a1c3-d325-462d-89d5-fa6fe88b8de9.png)
![aragorn](https://user-images.githubusercontent.com/32385870/163376674-10b9e32a-ab77-4fec-89b6-c0bef4061345.png)


With using bottoom navigator, we can reach post page of the fandom

![fandom posts](https://user-images.githubusercontent.com/32385870/163373662-386e1465-7ba2-4b98-805e-1bbed76963de.png)

With clicking the button at the top right corner, we can be a member of this fandom. After that we can send posts (with image) too

![fandom membership](https://user-images.githubusercontent.com/32385870/163374212-f07b817d-186a-4cb2-b6ba-c6a1b6f1fd22.png)
![send post](https://user-images.githubusercontent.com/32385870/163375524-ada4e21d-3a79-4a56-a6c9-0fecc661f10a.png)

After Sending post other members will recieve notification

![notification](https://user-images.githubusercontent.com/32385870/163375928-5aba343c-fdc5-443d-b33e-64273b5d34a3.png)

### Fandom Creation
![create fandom](https://user-images.githubusercontent.com/32385870/163376885-507d48eb-fa0b-4953-896c-6312fbbb54e1.png)
![creating fandom](https://user-images.githubusercontent.com/32385870/163376874-6c749c69-3c8e-424c-901f-ad7f4a9ee36c.png)
![after creation](https://user-images.githubusercontent.com/32385870/163376908-0f84a5f9-9b29-4e10-b190-ba78e3499e2f.png)

### My Fandoms
Shows fandoms that we are member of

![my fandoms](https://user-images.githubusercontent.com/32385870/163377083-4e1c86db-157c-431f-abe1-45e6aba8f5ca.png)

### Leaderboard
Shows list of fandoms order by number of members

![leaderbaord](https://user-images.githubusercontent.com/32385870/163377286-bbdba958-5fa2-49e5-914a-7ecce9d59a21.png)

### Settings
In Settings we can change theme of application and enable/disable notifications

![settings](https://user-images.githubusercontent.com/32385870/163377366-a9eef738-0825-4d7a-93cd-1c3f0b807b3f.png)

### Dark Theme
![dark theme](https://user-images.githubusercontent.com/32385870/163377550-59ac506f-e4a6-4f6b-804b-5684ea7b3e23.png)
![dark theme 2](https://user-images.githubusercontent.com/32385870/163377565-3d28a04b-a806-469b-a99f-12a05cb4a34e.png)

