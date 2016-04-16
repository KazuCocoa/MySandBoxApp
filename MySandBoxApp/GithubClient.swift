// https://httpbin.org/

import Alamofire

class GithubClient {

    let githuGist = "https://api.github.com/users/KazuCocoa/gists"

    func getPublicGist(user: String) {
        Alamofire.request(.GET, githuGist)
            .responseJSON { response in
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
        }
    }
}
