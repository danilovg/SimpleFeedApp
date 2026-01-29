import Foundation

final class PostListViewModel {

    private let networkService: NetworkService
    private(set) var posts: [Post] = []

    var onDataUpdated: (() -> Void)?
    var onError: ((String) -> Void)?

    init(networkService: NetworkService = NetworkService()) {
        self.networkService = networkService
    }

    func loadPosts() {
        networkService.fetchPosts { [weak self] result in
            switch result {
            case .success(let posts):
                self?.posts = posts
                self?.onDataUpdated?()
            case .failure(let error):
                self?.onError?(error.localizedDescription)
            }
        }
    }

    func post(at index: Int) -> Post {
        posts[index]
    }
}
