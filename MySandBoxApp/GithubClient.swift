// https://httpbin.org/

import Alamofire
import Himotoki

struct GitHubGist: Decodable {
    let url: String
    let id: String
    let publicGist: Bool
    let owner: String

    // MARK: Decodable

    static func decode(_ e: Extractor) throws -> GitHubGist {
        return try GitHubGist(
            url: e <| "url",
            id: e <| "id",
            publicGist: e <| "public",
            owner: e <| ["owner", "login"]
        )
    }
}

struct GithubClient {
    let githuGist = "https://api.github.com/users/KazuCocoa/gists"
}
