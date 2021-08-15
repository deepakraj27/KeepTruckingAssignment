# KeepTruckingAssignment

This app demonstrates the SEARCH feature with simple API call <Open Api> 
  
I have used ALAMOFIRE to handle API Calls and Mapped JSON's to my CODABLE MODEL. All the codable models are tested with UNIT test with mock data. 
 
I have used MVVM Architecture and cleanly designed the SEARCH Feature, where SearchViewController Talks to ViewModel to update the VC and ViewModel talks to NetworkManager, Which has a generic function to return the JSON as codable models. And once the Async Api call is done ViewModel will let the VC know about the changes and TableView is updated with values
  
Attaching screenshots of UI
  
## Results View Sample

iPad             |  iPhone
:-------------------------:|:-------------------------:
![](https://github.com/deepakraj27/KeepTruckingAssignment/blob/main/ScreenShots/Simulator%20Screen%20Shot%20-%20iPad%20(8th%20generation)%20-%202021-08-15%20at%2022.15.45.png)  |  ![](https://github.com/deepakraj27/KeepTruckingAssignment/blob/main/ScreenShots/Simulator%20Screen%20Shot%20-%20iPhone%2011%20-%202021-08-15%20at%2022.16.17.png)

## No Results View Sample
  
iPad             |  iPhone
:-------------------------:|:-------------------------:
![](https://github.com/deepakraj27/KeepTruckingAssignment/blob/main/ScreenShots/Simulator%20Screen%20Shot%20-%20iPad%20(8th%20generation)%20-%202021-08-15%20at%2022.15.35.png)  |  ![](https://github.com/deepakraj27/KeepTruckingAssignment/blob/main/ScreenShots/Simulator%20Screen%20Shot%20-%20iPhone%2011%20-%202021-08-15%20at%2022.16.11.png)
  
  
## Test Cases
  
  Added Test Cases for all Models and got a chance to start test cases for Tableview as well.
  
  ### Models Test Cases
  
  SearchResults Model             |  GeoNames Model
:-------------------------:|:-------------------------:
![](https://github.com/deepakraj27/KeepTruckingAssignment/blob/main/ScreenShots/Screenshot%202021-08-15%20at%2010.57.54%20PM.png)  |  ![](https://github.com/deepakraj27/KeepTruckingAssignment/blob/main/ScreenShots/Screenshot%202021-08-15%20at%2010.58.13%20PM.png)
  
  ### TableView Test Cases
  ![](https://github.com/deepakraj27/KeepTruckingAssignment/blob/main/ScreenShots/Screenshot%202021-08-15%20at%2010.57.40%20PM.png)  
