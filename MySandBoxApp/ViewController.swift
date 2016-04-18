import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var gistLits: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()

        gistLits.text = "viewDidLoad\n"
    }

    override func viewWillAppear(animated: Bool) {

        let client = MyHttpBinClient()
        client.getHttpBinGet()

        getGistAndUpdateView()
    }

    func getGistAndUpdateView() {
        Alamofire.request(.GET, GithubClient().githuGist)
            .responseJSON { response in
                if let JSON = response.result.value as? Array<Dictionary<String, AnyObject>> {
                    JSON.forEach { json in
                        let result = try? GitHubGist.decodeValue(json)
                        self.gistLits.text?.appendContentsOf("url: " + (result?.url)! + "\n")
                        self.gistLits.text?.appendContentsOf("id: " + (result?.id)! + "\n")
                        self.gistLits.text?.appendContentsOf("owner: " + (result?.owner)! + "\n\n")

                    }
                }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

