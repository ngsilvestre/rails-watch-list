Movie.delete_all
List.delete_all
Bookmark.delete_all

movies = [
  {
    title: "Wonder Woman 1984",
    overview:"Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s.",
    poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg",
    rating: 6.9
  },
  {
    title: "The Shawshank Redemption",
    overview:"Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison",
    poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg",
    rating: 8.7
  },
  {
    title: "Titanic",
    overview:"101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.",
    poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg",
    rating: 7.9
  },
  {
    title: "Ocean's Eight",
    overview:"Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.",
    poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg",
    rating: 7.0
  }
]

lists = [
  {name: "Drama"},
  {name: "All time favourites"},
  {name: "Girl Power"},
]

bookmarks = [
  {comment: "Recommended by John", movie_id: 3, list_id: 2},
  {comment: "Superhero movie revisited in 2020", movie_id: 1, list_id: 3},
  {comment: "Spielberg's masterly Oscar-winning drama", movie_id: 2, list_id: 2},
  {comment: "2020 release", movie_id: 5, list_id: 1},
  {comment: "Based on Stephen King's 1996 novel", movie_id: 4, list_id: 3},
]

movies.each do |movie|
  Movie.create(movie)
end

lists.each do |list|
  List.create(list)
end

bookmarks.each do |bookmark|
  Bookmark.create(bookmark)
end
