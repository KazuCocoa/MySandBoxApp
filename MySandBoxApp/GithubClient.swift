// https://httpbin.org/

import Alamofire
import Himotoki

struct GitHubGist: Decodable {
    let url: String
    let id: String
    let publicGist: Bool
    let owner: String

    // MARK: Decodable

    static func decode(e: Extractor) throws -> GitHubGist {
        return try GitHubGist(
            url: e <| "url",
            id: e <| "id",
            publicGist: e <| "public",
            owner: e <| ["owner", "login"]
        )
    }
}

class GithubClient {

    let githuGist = "https://api.github.com/users/KazuCocoa/gists"

    func getPublicGist(user: String) {
        Alamofire.request(.GET, githuGist)
            .responseJSON { response in
                // Example:
                // [MyHttpBinClient]: ip is Optional("119.31.155.178")
                // ========== Optional(MySandBoxApp.GitHubGist(url: "https://api.github.com/gists/344c9f4730aa30d5510c", id: "344c9f4730aa30d5510c", publicGist: true, owner: "KazuCocoa"))
                // ========== Optional(MySandBoxApp.GitHubGist(url: "https://api.github.com/gists/1a0a1d712c2baecccad7", id: "1a0a1d712c2baecccad7", publicGist: true, owner: "KazuCocoa"))
                // ========== Optional(MySandBoxApp.GitHubGist(url: "https://api.github.com/gists/26a5f3ee8b9bb19aafb5", id: "26a5f3ee8b9bb19aafb5", publicGist: true, owner: "KazuCocoa"))
                if let JSON = response.result.value as? Array<Dictionary<String, AnyObject>> {
                    JSON.forEach { json in
                        let result = try? GitHubGist.decodeValue(json)
                        print("========== \(result)")
                    }
                }
        }
    }
}
