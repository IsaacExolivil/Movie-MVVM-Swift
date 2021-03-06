
import Foundation

// MARK: - MovieNowPlaying
struct MovieDetail: Codable {
    let backdropPath: String?
    let genres: [Genre]?
    let id: Int?
    let imdbID, originalTitle, overview: String?
    let popularity: Double?
    let posterPath: String?
    let voteAverage: Double?
    let title: String?
    
    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case genres, id
        case imdbID = "imdb_id"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case title
    }
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int?
    let name: String?
}

