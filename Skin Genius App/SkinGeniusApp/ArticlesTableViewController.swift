import UIKit

class ArticlesTableViewController: UITableViewController {
    
    // Array to hold your articles
    var articles: [Article] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 200
        // Load your articles here (you can load them from a JSON file, database, or create them manually)
        loadArticles()
        
        // Register custom UITableViewCell if you have one
        // tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomCell")
    }
    
    // Function to load articles
    func loadArticles() {
        // Assuming you've already created your articles array
        
        // Add your articles to the articles array
        articles.append(firstArticle)
        articles.append(secondArticle) 
        articles.append(thirdArticle) 
        articles.append(fourthArticle)// Add your articles similarly
        
        // Reload the table view to display the articles
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let article = articles[indexPath.row]
        
        // Configure the cell
        cell.textLabel?.text = article.title
        // Set the image if you have one
        cell.imageView?.image = UIImage(named: article.imageName)
        // Set the subtitle if you have one
        cell.detailTextLabel?.text = article.subtitle
        
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowArticleDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let selectedArticle = articles[indexPath.row]
                let destinationVC = segue.destination as! ArticleDetailViewController
                destinationVC.article = selectedArticle
            }
        }
    }
}

