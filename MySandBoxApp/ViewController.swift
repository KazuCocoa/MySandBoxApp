import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let client = MyHttpBinClient()
        client.getHttpBinGet()

        let githubClient = GithubClient()
        githubClient.getPublicGist("KazuCocoa")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

