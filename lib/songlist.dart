class Song {
  late String url;
  String title;
  String artist;
  String img;

  Song(
      {required this.url,
      required this.artist,
      required this.title,
      required this.img});
}

class Playlist {
 List<Song> myplaylist = [
    Song(
        url:
            'https://msicoursematerial.s3.us-west-2.amazonaws.com/-La_min_Lay_(getmp3.pro).mp3',
        title: 'La Min Lay',
        artist: 'R Zar Ni',
        img: 'a.png'),
    Song(
        url:
            'https://msicoursematerial.s3.us-west-2.amazonaws.com/Amazing_Day_(getmp3.pro).mp3',
        title: 'Amazing Day',
        artist: 'Coldplay',
        img: 'b.png'),
    Song(
        url:
            'https://msicoursematerial.s3.us-west-2.amazonaws.com/Coldplay+X+Selena+Gomez+-+Let+Somebody+Go+(Official+Video).mp3',
        title: 'Let Sombody Go',
        artist: 'Coldplay + Selena Gomez',
        img: 'c.jpg'),
    Song(
        url:
            'https://msicoursematerial.s3.us-west-2.amazonaws.com/Hugh_Grant_Haley_Bennett_-_A_Way_(getmp3.pro).mp3',
        title: 'Way Back Into Love',
        artist: 'Hugh Grant',
        img: 'd.png'),
  ];
}
