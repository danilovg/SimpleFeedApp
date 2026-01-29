import UIKit

final class PostListViewController: UIViewController {

    private let tableView = UITableView()
    private let viewModel = PostListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Posts"
        view.backgroundColor = .white

        setupTableView()
        bindViewModel()
        viewModel.loadPosts()
    }

    private func setupTableView() {
        tableView.frame = view.bounds
        tableView.dataSource = self
        view.addSubview(tableView)
    }

    private func bindViewModel() {
        viewModel.onDataUpdated = { [weak self] in
            self?.tableView.reloadData()
        }

        viewModel.onError = { error in
            print("Error:", error)
        }
    }
}

extension PostListViewController: UITableViewDataSource {

    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        viewModel.posts.count
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {

        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let post = viewModel.post(at: indexPath.row)

        cell.textLabel?.text = post.title
        cell.detailTextLabel?.text = post.body
        cell.detailTextLabel?.numberOfLines = 0

        return cell
    }
}
