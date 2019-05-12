# The Movie Database (TMDb) iOS App
This application developed without using a storyboard. The first window starts by AppDelegate window property. All api request runs with Service singleton pattern.

## Screenshots
| Main Screen      | Display Mode      | Details Screen      | Search Screen      | 
|:----------------:|:-----------------:|:-------------------:|:------------------:|
| ![main-screen][] | ![display-mode][] | ![details-screen][] | ![search-screen][] |

## Dependencies
App uses *[SDWebImage](https://github.com/SDWebImage/SDWebImage)* library for download and cache movie posters. SDWebImage provides an async image downloader with cache support.

## Api Links
**Api Link:** [https://developers.themoviedb.org/3](https://developers.themoviedb.org/3)
Search Query;
https://api.themoviedb.org/3/search/movie?api_key={api_key}&query=Jack+Reacher
Popular Movie;
https://api.themoviedb.org/3/movie/popular?language=en-US&api_key={api_key}&page=1
Movie Details;
https://api.themoviedb.org/3/movie/287947?language=en-US&api_key={api_key}

[main-screen]: https://github.com/perpeer/themoviedb/blob/master/images/MainScreen.png?raw=true
[display-mode]: https://github.com/perpeer/themoviedb/blob/master/images/DisplayMode.png?raw=true
[details-screen]: https://github.com/perpeer/themoviedb/blob/master/images/DetailsScreen.png?raw=true
[search-screen]: https://github.com/perpeer/themoviedb/blob/master/images/SearchScreen.png?raw=true

